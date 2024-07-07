import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          color: Colors.amber,
          child: const Text("김원중의 문단속"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(Icons.heart_broken),
                  title: Text("설정 페이지"),
                );
              }),
        )
      ],
    ));
  }
}
