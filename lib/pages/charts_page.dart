import 'package:flutter/material.dart';
import 'package:stikku_frontend/utils/ticket_clipper.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("차트 페이지"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: DolDurmaClipper(right: 20, holeRadius: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.blueAccent,
                  ),
                  width: 300,
                  height: 95,
                  padding: const EdgeInsets.all(15),
                  child: const Text('first example'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipPath(
                clipper: DolDurmaClipper(right: 100, holeRadius: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.amber,
                  ),
                  width: 200,
                  height: 250,
                  padding: const EdgeInsets.all(35),
                  child: const Text('second example'),
                ),
              ),
            ]));
  }
}
