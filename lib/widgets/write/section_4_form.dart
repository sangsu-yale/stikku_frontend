part of '../../pages/write_page.dart';

class _Section4Form extends StatelessWidget {
  const _Section4Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
