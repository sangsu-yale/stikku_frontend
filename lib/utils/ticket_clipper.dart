import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // 좌측 상단 모서리
    path.moveTo(10.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 좌측 중간 아치
    path.lineTo(0.0, size.height * 3 / 5);
    path.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 좌측 하단 모서리
    path.lineTo(0.0, size.height - 5);
    path.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 하단 모서리
    path.lineTo(size.width - 5, size.height);
    path.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 중간 아치
    path.lineTo(size.width, size.height * 3 / 5 + 16);
    path.relativeArcToPoint(const Offset(0, -17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 우측 상단 모서리
    path.lineTo(size.width, 5.0);
    path.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    path.lineTo(10.0, 0.0);
    path.relativeArcToPoint(const Offset(0, 0),
        radius: const Radius.circular(10.0), largeArc: false, clockwise: false);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 그림자에 사용할 페인트
    Paint shadowPaint = Paint()
      ..color = const Color.fromARGB(90, 121, 121, 121) // 그림자 색상 및 투명도 설정
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5); // 블러 효과

    // 실제 모양에 사용할 페인트
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = const Color.fromARGB(255, 219, 219, 219);

    // 그림자의 경로 (바깥쪽)
    Path shadowPath = Path();
    shadowPath.moveTo(0, 0.0); // 오른쪽으로 5, 위로 -5만큼 이동
    shadowPath.lineTo(5.0, 0.0);
    shadowPath.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(5.0 - 5, size.height * 3 / 5);
    shadowPath.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    shadowPath.lineTo(5.0 - 5, size.height - 10 + 5);
    shadowPath.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 10 + 5, size.height - 5 + 5);
    shadowPath.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 5 + 5, size.height * 3 / 5 + 25 - 5);
    shadowPath.relativeArcToPoint(const Offset(0, -20),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 5 + 5, 10.0 - 5);
    shadowPath.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(15.0 + 5, 5.0 - 5);

    // 그림자 그리기
    canvas.drawPath(shadowPath, shadowPaint);

    // 원래 모양의 경로
    Path path = Path();
    path.moveTo(10.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 좌측 중간 아치
    path.lineTo(0.0, size.height * 3 / 5);
    path.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 좌측 하단 모서리
    path.lineTo(0.0, size.height - 5);
    path.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 하단 모서리
    path.lineTo(size.width - 5, size.height);
    path.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 중간 아치
    path.lineTo(size.width, size.height * 3 / 5 + 16);
    path.relativeArcToPoint(const Offset(0, -17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 우측 상단 모서리
    path.lineTo(size.width, 5.0);
    path.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    path.lineTo(10.0, 0.0);
    path.relativeArcToPoint(const Offset(0, 0),
        radius: const Radius.circular(10.0), largeArc: false, clockwise: false);

    path.close();

    // 모양 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
