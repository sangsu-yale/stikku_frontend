import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("설정 페이지"),
      ),
      body: const Center(
        child: Text("설정 페이지 입니다"),
      ),
    );
  }
}
