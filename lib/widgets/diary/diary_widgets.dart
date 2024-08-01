import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/widgets/write/basic_form_widget.dart';

// ✅ 경기 리뷰 string
class Review extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Review({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "경기 리뷰",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(170, 0, 0, 0)),
        ),
        const SizedBox(height: 10),
        diaryBuildTitleAndCommentInput(
            '경기 리뷰를 작성해 주세요', formController.reviewCommentCon, 2, 9)
      ],
    );
  }
}

// ✅ 수훈선수 string
class PlayerOfTheMatch extends StatelessWidget {
  final FormController formController = Get.find();

  final String title;
  final String id;

  PlayerOfTheMatch({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "수훈 선수",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(170, 0, 0, 0)),
        ),
        const SizedBox(height: 10),
        diaryBuildTitleAndCommentInput(
            '오늘의 BEST 플레이어는?', formController.playerOfTheMatchCon, 1, 5)
      ],
    );
  }
}

// ✅ 직관음식 string
class Food extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Food({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "직관 음식",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(170, 0, 0, 0)),
        ),
        const SizedBox(height: 10),
        diaryBuildTitleAndCommentInput(
            '오늘의 직관 음식', formController.foodCon, 1, 5)
      ],
    );
  }
}

// 별점 int
class Rating extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Rating({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "별점",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(170, 0, 0, 0)),
        ),
        const SizedBox(height: 10),
        Obx(() {
          return Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                child: Icon(
                  size: 30,
                  index < formController.rating.value
                      ? Custom.star_1
                      : Custom.star,
                  color: Colors.blue,
                ),
                onTap: () {
                  formController.setRating(index + 1);
                },
              );
            }),
          );
        }),
      ],
    );
  }
}

// 기분 string
class Mood extends StatelessWidget {
  final FormController formController = Get.find();
  final List<Map<String, dynamic>> moods = [
    {'icon': Custom.smiley, 'label': 'HAPPY'},
    {'icon': Custom.smileyxeyes, 'label': 'SURPRISED'},
    {'icon': Custom.smileyangry, 'label': 'MAD'},
    {'icon': Custom.smileyblank, 'label': 'BORED'},
    {'icon': Custom.smileywink, 'label': 'FUN'},
  ];

  // HAPPY, SURPRISED, ASTONISHED, BORED, FUN
  final String id;
  final String title;

  Mood({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "기분",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(170, 0, 0, 0)),
        ),
        const SizedBox(height: 10),
        Obx(() {
          return Row(
            children: moods.map((mood) {
              return GestureDetector(
                child: Icon(
                  size: 30,
                  mood['icon'],
                  color: formController.mood.value == mood['label']
                      ? Colors.blue
                      : Colors.grey,
                ),
                onTap: () {
                  formController.setMood(mood['label']);
                },
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}

// <----------------------------------- 😡 adv ------------------------------------->

// // 라인업1  ["string", "string2", ... ]
// class HomeTeamLineup extends StatelessWidget {
//   final FormController formController = Get.find();

//   final String id;
//   final String title;

//   HomeTeamLineup({super.key, required this.title, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       decoration: InputDecoration(hintText: "라인업"),
//     );
//   }
// }

// // 라인업2  ["string", "string2", ... ]
// class AwayTeamLineup extends StatelessWidget {
//   final FormController formController = Get.find();

//   final String id;
//   final String title;

//   AwayTeamLineup({super.key, required this.title, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       decoration: InputDecoration(hintText: "라인업2"),
//     );
//   }
// }
