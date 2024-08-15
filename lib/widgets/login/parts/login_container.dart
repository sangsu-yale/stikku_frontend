part of '../../../pages/login_page.dart';

class _LoginContainer extends StatelessWidget {
  const _LoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  try {
                    login();
                  } catch (e) {
                    Exception(e);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12, // 그림자의 색상과 투명도
                          offset: Offset(0, 2.0), // 그림자의 위치
                          blurRadius: 0, // 흐림 정도
                          spreadRadius: 0, // 퍼짐 정도
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "구글 연동하기",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
