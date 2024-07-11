import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

// ✅ 경기 리뷰 string
class Review extends StatelessWidget {
  final String id;
  final String title;

  const Review({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("경기 리뷰"),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "경기 리뷰",
          ),
        ),
      ],
    );
  }
}

// ✅ 수훈선수 string
class PlayerOfTheMatch extends StatelessWidget {
  final String title;
  final String id;

  const PlayerOfTheMatch({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "수훈선수"),
    );
  }
}

// ✅ 직관음식 string
class Food extends StatelessWidget {
  final String id;
  final String title;

  const Food({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "직관음식"),
    );
  }
}

// <----------------------------------- 😡 adv ------------------------------------->

// 별점 int
class Rating extends StatelessWidget {
  final String id;
  final String title;

  const Rating({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}

// 기분 string
class Mood extends StatelessWidget {
  final String id;
  final String title;

  const Mood({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "기분"),
    );
  }
}

// 라인업1  ["string", "string2", ... ]
class HomeTeamLineup extends StatelessWidget {
  final String id;
  final String title;

  const HomeTeamLineup({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "라인업"),
    );
  }
}

// 라인업2  ["string", "string2", ... ]
class AwayTeamLineup extends StatelessWidget {
  final String id;
  final String title;

  const AwayTeamLineup({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "라인업2"),
    );
  }
}
