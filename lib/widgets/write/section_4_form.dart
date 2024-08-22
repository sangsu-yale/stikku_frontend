part of '../write/game_result_form.dart';

class _Section4Form extends StatelessWidget {
  const _Section4Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Colors.blue),
          left: BorderSide(width: 1.0, color: Colors.blue),
          right: BorderSide(width: 1.0, color: Colors.blue),
          // 아래쪽 경계선을 설정하지 않음
        ),
      ),
      // 4번 폼 (사진)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "사진",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(170, 0, 0, 0)),
              ),
              Text(
                " (옵션)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return formController.selectedImage.value != null
                    ? Column(
                        children: [
                          Image.file(
                            formController.selectedImage.value!,
                            width: MediaQuery.of(context).size.width / 1.4,
                          ),
                          IconButton(
                            onPressed: formController.deleteImage,
                            icon: const Icon(Custom.x, color: Colors.blue),
                          )
                        ],
                      )
                    : SizedBox(
                        height: 150,
                        child: IconButton(
                          onPressed: formController.pickImage,
                          icon: const Icon(
                            Custom.image_1,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
