import 'package:flutter/material.dart';

Widget buildTitleAndCommentInput(String hintTextInput,
    TextEditingController controller, int minLines, int maxLines) {
  return TextFormField(
    maxLength: 30,
    minLines: minLines,
    maxLines: maxLines,
    controller: controller,
    buildCounter: (context,
        {required currentLength, required isFocused, maxLength}) {
      return null;
    },
    decoration: InputDecoration(
      hintStyle: const TextStyle(color: Colors.black26),
      hintText: hintTextInput,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
      ),
    ),
  );
}

Widget diaryBuildTitleAndCommentInput(String hintTextInput,
    TextEditingController controller, int minLines, int maxLines) {
  return TextFormField(
    minLines: minLines,
    maxLines: maxLines,
    controller: controller,
    buildCounter: (context,
        {required currentLength, required isFocused, maxLength}) {
      return null;
    },
    decoration: InputDecoration(
      hintStyle: const TextStyle(color: Colors.black26),
      hintText: hintTextInput,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
      ),
    ),
  );
}
