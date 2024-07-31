import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';

class DiaryForm extends StatelessWidget {
  DiaryForm({super.key});
  final diaryDialogController = Get.put(DiaryDialogController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.0, color: Colors.blue),
              ),
              child: Column(
                children: [
                  // Removed Expanded
                  Obx(
                    () => ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...diaryDialogController.pageWidgets.map(
                          (widget) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: widget.values.first),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => diaryDialogController
                                      .removePageWidget(widget),
                                  child: const Icon(Custom.x,
                                      size: 20, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shadowColor: WidgetStateProperty.all<Color>(
                                Colors.transparent),
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.blue),
                            padding: WidgetStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(0)),
                            textStyle: WidgetStateProperty.all<TextStyle>(
                                const TextStyle(fontSize: 18)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.dialog(DiaryDialogWidget(
                                diaryDialogController: diaryDialogController));
                          },
                          child: const Icon(Custom.pluscircle, size: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "일기는 작성하지 않아도 상관없어요",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
