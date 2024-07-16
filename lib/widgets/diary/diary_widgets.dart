import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

// ✅ 경기 리뷰 string
class Review extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Review({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("경기 리뷰"),
        TextField(
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: "경기 리뷰",
          ),
          onChanged: (value) {
            formController.review.value = value;
          },
        ),
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
    return TextField(
      onChanged: (value) {
        formController.playerOfTheMatch.value = value;
      },
      decoration: const InputDecoration(hintText: "수훈선수"),
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
    return TextField(
      onChanged: (value) {
        formController.food.value = value;
      },
      decoration: const InputDecoration(hintText: "직관음식"),
    );
  }
}

// <----------------------------------- 😡 adv ------------------------------------->

// 별점 int
class Rating extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Rating({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}

// 기분 string
class Mood extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  Mood({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "기분"),
    );
  }
}

// 라인업1  ["string", "string2", ... ]
class HomeTeamLineup extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  HomeTeamLineup({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "라인업"),
    );
  }
}

// 라인업2  ["string", "string2", ... ]
class AwayTeamLineup extends StatelessWidget {
  final FormController formController = Get.find();

  final String id;
  final String title;

  AwayTeamLineup({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "라인업2"),
    );
  }
}
