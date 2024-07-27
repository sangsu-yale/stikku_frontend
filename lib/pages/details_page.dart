import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/pages/write_page.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/widgets/details/front_view.dart';

part '../widgets/details/appbar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final GameResult gameResult = Get.arguments!;
  final isarController = Get.find<IsarService>();
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);
    final smallSize = MediaQuery.of(context).size.height < 700;

    return Scaffold(
      appBar: _AppBar(formController: formController, gameResult: gameResult),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              elevation: 4.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: index == 0
                      ? FrontView(gameResult: gameResult, smallSize: smallSize)
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    border: Border.all(),
                                  ),
                                  //child: const Text(""),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      border: Border.symmetric(
                                          vertical: BorderSide())),
                                ),
                                // child: const Text(""),
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(),
                                  ),
                                  // child: const Text(""),
                                ),
                              ),
                            ],
                          ),
                        )),
            );
          },
        ),
      ),
    );
  }
}
