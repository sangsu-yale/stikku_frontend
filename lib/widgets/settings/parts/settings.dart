part of '../../../pages/settings_page.dart';

class _Settings extends StatelessWidget {
  const _Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Text(
              "설정",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/userdata');
            },
            child: const ListTile(
              leading: Icon(Custom.pingpong, color: Colors.blue),
              title: Text("유저 및 데이터"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Custom.target, color: Colors.blue),
              title: Text("문의하기"),
            ),
          ),
          GestureDetector(
            onTap: () async {},
            child: const ListTile(
              leading: Icon(Custom.checkerboard_1, color: Colors.blue),
              title: Text("메뉴 아이콘 변경하기"),
            ),
          ),
        ],
      ),
    );
  }
}
