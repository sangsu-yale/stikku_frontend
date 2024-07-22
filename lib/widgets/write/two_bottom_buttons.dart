part of '../../pages/write_page.dart';

// class _TwoBottomButtons extends StatelessWidget {
//   const _TwoBottomButtons({
//     required this.formController,
//   });

//   final FormController formController;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Row(
//         children: <Widget>[
//           // <------------- 작성 완료 버튼 ------------->
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 if (formController.validate() == false) {
//                   Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
//                 } else {
//                   formController.submit();
//                 }
//               },
//               child: Container(
//                 color: Colors.blue[100],
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("작성 완료", style: TextStyle(color: Colors.black))
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // <------------- 일기 작성 버튼 ------------->
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 if (formController.validate() == false) {
//                   Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
//                 } else {
//                   Get.toNamed('/diary');
//                 }
//               },
//               child: Container(
//                 color: const Color.fromARGB(255, 80, 80, 80),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("일기 작성하기 >", style: TextStyle(color: Colors.white))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
