import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

class WritePage extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());
  final FormController formController = Get.put(FormController());
  final DiaryDialogController diaryDialogController =
      Get.put(DiaryDialogController());

  WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> daynResult = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("경기 기록 작성 페이지"),
        ),

        // body
        body: Container(
          padding: const EdgeInsets.all(15),

          // <------------- 스크롤뷰 ------------->
          child: SingleChildScrollView(
            // <------------- 폼 시작 ------------->
            child: Column(
              children: [
                // 1번 상자
                Container(
                  color: Colors.green,
                  // * 1번 폼 (✅ 직관 유무, 점수 2, 팀 이름 2, 응원팀 2)
                  child: Column(
                    children: [
                      // ✅ 직관 유무
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                formController.setSelectedValue(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: !formController.viewingMode.value
                                        ? Colors.blue
                                        : Colors.transparent,
                                    width: 2.0,
                                  ),
                                ),
                                // color: Colors.white,
                                child: const Column(
                                  children: [Icon(Icons.home), Text("집관")],
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                formController.setSelectedValue(true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: formController.viewingMode.value
                                        ? Colors.blue
                                        : Colors.transparent,
                                    width: 2.0,
                                  ),
                                ),
                                // color: Colors.white,
                                child: const Column(
                                  children: [
                                    Icon(Icons.group_rounded),
                                    Text("직관")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ✅ 점수, 팀 이름, 응원팀
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                // 팀 1 점수
                                Obx(() {
                                  return TextField(
                                    onChanged: (value) {
                                      formController.score1.value = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      border: formController.score1.value == ""
                                          ? const OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.red))
                                          : null,
                                    ),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter
                                          .digitsOnly // 숫자만 입력 가능하도록 설정
                                    ],
                                  );
                                }),

                                // 팀 이름
                                TextField(
                                  onChanged: (value) {
                                    formController.team1.value = value;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '팀 이름',
                                    border: formController.team1.value == ""
                                        ? const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red))
                                        : null,
                                  ),
                                ),

                                // 1팀 응원
                                Obx(
                                  () {
                                    return CheckboxListTile(
                                      checkColor: Colors.black,
                                      title: const Text("응원팀"),
                                      value: formController.team1IsMyTeam.value,
                                      onChanged: (bool? value) {
                                        formController.team1IsMyTeam.value
                                            ? formController
                                                .team1IsMyTeam.value = false
                                            : formController
                                                .team1IsMyTeam.value = true;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Flexible(
                              flex: 1, fit: FlexFit.tight, child: Text("vs")),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                // 2팀 점수
                                Obx(() {
                                  return TextField(
                                    onChanged: (value) {
                                      formController.score2.value = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      border: formController.score2.value == ""
                                          ? const OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.red))
                                          : null,
                                    ),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter
                                          .digitsOnly // 숫자만 입력 가능하도록 설정
                                    ],
                                  );
                                }),

                                // 2팀 이름
                                TextField(
                                  onChanged: (value) {
                                    formController.team2.value = value;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '팀 이름',
                                    border: formController.team2.value == ""
                                        ? const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red))
                                        : null,
                                  ),
                                ),

                                // 2팀 응원
                                Obx(
                                  () {
                                    return CheckboxListTile(
                                      checkColor: Colors.black,
                                      title: const Text("응원팀"),
                                      value: formController.team2IsMyTeam.value,
                                      onChanged: (bool? value) {
                                        formController.team2IsMyTeam.value
                                            ? formController
                                                .team2IsMyTeam.value = false
                                            : formController
                                                .team2IsMyTeam.value = true;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Text("응원팀은 없어도, 둘 다 해도 상관없어요!"),
                    ],
                  ),
                ),

                // 2번 상자
                Container(
                  color: Colors.amber,
                  // * ✅ 2번 폼 (경기장, 좌석)
                  child: Column(
                    children: [
                      // 경기장
                      Obx(() {
                        return TextFormField(
                          readOnly:
                              formController.viewingMode.value ? false : true,
                          decoration: InputDecoration(
                            hintText:
                                formController.viewingMode.value ? "경기장" : "집관",
                            border: formController.stadium.value == ""
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))
                                : null,
                          ),
                          onChanged: (value) {
                            formController.stadium.value = value;
                          },
                        );
                      }),

                      // 좌석
                      Obx(() {
                        return TextFormField(
                          readOnly:
                              formController.viewingMode.value ? false : true,
                          decoration: InputDecoration(
                            hintText:
                                formController.viewingMode.value ? "좌석" : "집관",
                            border: formController.seatLocation.value == ""
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))
                                : null,
                          ),
                          onChanged: (value) {
                            formController.seatLocation.value = value;
                          },
                        );
                      }),
                    ],
                  ),
                ),

                // 3번 상자
                Container(
                  color: Colors.blue,
                  // 3번 폼 (경기 제목, 한줄 코멘트)
                  child: Column(
                    // 경기 제목
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: '경기 제목'),
                        onChanged: (value) {
                          formController.title.value = value;
                        },
                      ),

                      // 한줄 코멘트
                      TextField(
                        decoration: const InputDecoration(labelText: '한줄 코멘트'),
                        onChanged: (value) {
                          formController.comment.value = value;
                        },
                      ),
                    ],
                  ),
                ),

                // 4번 상자
                Container(
                  color: Colors.teal,
                  // 4번 폼 (사진)
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return formController.selectedImage.value != null
                            ? Row(
                                children: [
                                  Image.file(
                                    formController.selectedImage.value!,
                                    height: 100,
                                  ),
                                  IconButton(
                                    onPressed: formController.deleteImage,
                                    icon: const Icon(Icons.cancel),
                                  )
                                ],
                              )
                            : IconButton(
                                onPressed: formController.pickImage,
                                icon: const Icon(Icons.image),
                              );
                      }),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // 확인 버튼 2개 (일기 작성 / 작성 완료)
        bottomNavigationBar: bottomButtons(daynResult));
  }

// 확인 버튼 2개 (일기 작성 / 작성 완료)
  SizedBox bottomButtons(Map<String, dynamic> daynResult) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          // <------------- 작성 완료 버튼 ------------->
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (formController.validate() == false) {
                  Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                } else {
                  formController.submit(daynResult);
                  Get.snackbar('Success', 'Form submitted successfully!');
                }
              },
              child: Container(
                color: Colors.blue[100],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("작성 완료", style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
          ),

          // <------------- 일기 작성 버튼 ------------->
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Get.toNamed('/diary');
                // if (formController.validate() == false) {
                //   Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                // } else {
                Get.toNamed('/diary');
                // }
              },
              child: Container(
                color: const Color.fromARGB(255, 80, 80, 80),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("일기 작성하기 >", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 핵심 기능
/// - 내비게이터
///   - ✅ 일기 작성 페이지로 이동하여 일기를 작성할 수 있다
///   - ✅ 일기 작성 페이지로 이동할 때 경기 기록 작성이 사라지지 않는다
///   - ✅ 일기 작성을 하지 않아도 작성 완료가 되어야 한다
///
/// - 폼
///   - ✅ 모든 폼이 들어가야 한다
///     - ✅ 승패 유무
///     - ✅ 직관 유무
///     - ✅ 응원팀 체크
///     - ✅ 경기장
///     - ✅ 좌석
///     - ✅ 사진
///     - ✅ 경기 제목
///     - ✅ 한줄 코멘트
///   - ✅ 사진을 지울 수 있다
///   - ✅ 필수 폼을 작성하지 않으면 작성 완료를 할 수 없어야 한다
///   - ✅ 일반 폼을 작성하지 않아도 작성 완료를 할 수 있다
///   - ✅ 이미지를 업로드할 수 있다
///   - ✅ 폼 유효성을 검사할 수 있다
///   - (😡adv) 이미지 편집을 할 수 있다
///   - (😡adv) 경기장을 고를 수 있다
///   - (😡adv) ✅ 직관 유무에 따라 폼이 바뀌어야 한다
///   - (😡adv) 사진을 다시 고를 수 있다
///
/// - 서버 API
///   - 서버에 폼의 데이터를 보낼 수 있다
///   - 로컬 스토리지에 데이터를 저장할 수 있다
///   - 서버에 이미지를 전달할 수 있다 (파일 값 물어볼 것)
