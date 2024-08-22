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

class DiaryTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // 구멍의 설정
    int holeCount = 12; // 구멍의 개수를 11개로 고정
    double holeRadius = 7.0;
    double holeDiameter = holeRadius * 2;

    // 구멍 사이의 간격 계산
    double holeSpacing =
        (size.width - 10.0 - holeDiameter * holeCount) / (holeCount - 1);

    // 상단 시작 - 라인 그리기
    path.moveTo(0.0, 0.0);
    path.lineTo(5.0 + holeRadius, 0.0);

    // 상단 구멍 생성 (relativeArcToPoint 사용)
    for (int i = 0; i < holeCount; i++) {
      double x = i * (holeDiameter + holeSpacing) + holeRadius;
      path.lineTo(5.0 + x - holeRadius, 0);
      path.relativeArcToPoint(Offset(holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      path.relativeArcToPoint(Offset(holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }
    // 마지막 라인 그리기
    path.lineTo(size.width, 0.0);

    // 우측 하단 모서리
    path.lineTo(size.width, size.height);

    // 하단 시작 - 라인 그리기
    path.lineTo((size.width - 5.0) - holeRadius, size.height);

    // 하단 구멍 생성 (relativeArcToPoint 사용)
    for (int i = holeCount; i > 0; i--) {
      double x = i * (holeDiameter + holeSpacing) - holeSpacing - holeRadius;
      path.lineTo(x + holeRadius + 5.0, size.height);
      path.relativeArcToPoint(Offset(-holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      path.relativeArcToPoint(Offset(-holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }

    // 마지막 라인 그리기
    path.lineTo(0.0, size.height);

    // 좌측 상단 모서리로 돌아감
    path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ShadowPainter extends CustomPainter {
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
      ..color = const Color.fromARGB(255, 223, 223, 223);

    // 구멍 설정
    int holeCount = 12; // 구멍의 개수를 12개로 고정
    double holeRadius = 8.0;
    double holeDiameter = holeRadius * 2;
    double holeSpacing =
        (size.width - 10.0 - holeDiameter * holeCount) / (holeCount - 1);

    // 그림자의 경로
    Path shadowPath = Path();

    // 좌측 상단 모서리
    shadowPath.moveTo(0.0, 0.0);
    shadowPath.lineTo(5.0 + holeRadius, 0.0);

    // 상단 구멍 생성
    for (int i = 0; i < holeCount; i++) {
      double x = i * (holeDiameter + holeSpacing) + holeRadius;
      shadowPath.lineTo(5.0 + x - holeRadius, 0);
      shadowPath.relativeArcToPoint(Offset(holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      shadowPath.relativeArcToPoint(Offset(holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }

    // 마지막 라인 그리기
    shadowPath.lineTo(size.width, 0.0);

    // 우측 하단 모서리
    shadowPath.lineTo(size.width, size.height);

    // 하단 구멍 생성
    shadowPath.lineTo((size.width - 5.0) - holeRadius, size.height);
    for (int i = holeCount; i > 0; i--) {
      double x = i * (holeDiameter + holeSpacing) - holeSpacing - holeRadius;
      shadowPath.lineTo(x + holeRadius + 5.0, size.height);
      shadowPath.relativeArcToPoint(Offset(-holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      shadowPath.relativeArcToPoint(Offset(-holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }

    // 좌측 하단 모서리
    shadowPath.lineTo(0.0, size.height);

    // 좌측 상단 모서리로 돌아감
    shadowPath.lineTo(0.0, 0.0);

    // 그림자 그리기
    canvas.drawPath(shadowPath.shift(const Offset(0, 0)), shadowPaint);

    // 원래 모양의 경로
    Path path = Path();

    // 좌측 상단 모서리
    path.moveTo(0.0, 0.0);
    path.lineTo(5.0 + holeRadius, 0.0);

    // 상단 구멍 생성
    for (int i = 0; i < holeCount; i++) {
      double x = i * (holeDiameter + holeSpacing) + holeRadius;
      path.lineTo(5.0 + x - holeRadius, 0);
      path.relativeArcToPoint(Offset(holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      path.relativeArcToPoint(Offset(holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }

    // 마지막 라인 그리기
    path.lineTo(size.width, 0.0);

    // 우측 하단 모서리
    path.lineTo(size.width, size.height);

    // 하단 구멍 생성
    path.lineTo((size.width - 5.0) - holeRadius, size.height);
    for (int i = holeCount; i > 0; i--) {
      double x = i * (holeDiameter + holeSpacing) - holeSpacing - holeRadius;
      path.lineTo(x + holeRadius + 5.0, size.height);
      path.relativeArcToPoint(Offset(-holeRadius, -holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
      path.relativeArcToPoint(Offset(-holeRadius, holeRadius),
          radius: Radius.circular(holeRadius),
          largeArc: false,
          clockwise: false);
    }

    // 좌측 하단 모서리
    path.lineTo(0.0, size.height);

    // 좌측 상단 모서리로 돌아감
    path.lineTo(0.0, 0.0);

    // 모양 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TextPatternPainter extends CustomPainter {
  final String text; // 텍스트를 받을 변수

  TextPatternPainter({required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.black.withOpacity(0.1), // 텍스트 색상 및 투명도
      fontSize: 15,
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // 텍스트를 25도 회전
    canvas.save();
    canvas.rotate(-20 * 3.1415927 / 180);

    // 텍스트 간의 수평 및 수직 간격을 설정하는 변수
    final double horizontalStep = textPainter.width + 15; // 수평 간격
    final double verticalStep = textPainter.height + 5; // 수직 간격
    final double offsetStep = textPainter.width / 1; // 지그재그 오프셋

    // 텍스트 패턴을 캔버스에 지그재그로 그리기
    bool shouldOffset = false;
    for (double y = -size.height; y < size.height * 3; y += verticalStep) {
      for (double x = -size.width; x < size.width * 3; x += horizontalStep) {
        double offsetX = shouldOffset ? offsetStep : 0;
        textPainter.paint(canvas, Offset(x + offsetX, y));
      }
      shouldOffset = !shouldOffset; // 줄마다 오프셋을 바꿈
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
