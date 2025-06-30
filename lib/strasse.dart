import 'package:flutter/material.dart';

class Strasse extends StatelessWidget {
  const Strasse({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: screenWidth * 0.63,
            height: screenHeight * 0.152,
          ),
          Container(
            color: Colors.grey,
            width: screenWidth * 0.152,
            height: screenHeight * 0.63,
          ),
          CustomPaint(
            size: Size(screenHeight, screenWidth),
            painter: Linie(
              horizontaleStrassenBreite: screenWidth * 0.63,
              horizontaleStrassenHoehe: screenHeight * 0.152,
              vertikaleStrassenBreite: screenWidth * 0.152,
              vertikaleStrassenHoehe: screenHeight * 0.63,
            ),
          ),
        ],
      ),
    );
  }
}

class Linie extends CustomPainter {
  final double horizontaleStrassenBreite;
  final double horizontaleStrassenHoehe;
  final double vertikaleStrassenBreite;
  final double vertikaleStrassenHoehe;

  Linie({
    required this.horizontaleStrassenBreite,
    required this.horizontaleStrassenHoehe,
    required this.vertikaleStrassenBreite,
    required this.vertikaleStrassenHoehe,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    _drawDashedLine(
      canvas,
      paint,
      Offset(centerX - horizontaleStrassenBreite / 2, centerY),
      Offset(centerX + horizontaleStrassenBreite / 2, centerY),
      dashWidth: 20,
      dashSpace: 15,
    );
    _drawDashedLine(
      canvas,
      paint,
      Offset(centerX, centerY - vertikaleStrassenHoehe / 2),
      Offset(centerX, centerY + vertikaleStrassenHoehe / 2),
      dashWidth: 20,
      dashSpace: 15,
    );
  }

  void _drawDashedLine(
    Canvas canvas,
    Paint paint,
    Offset start,
    Offset end, {
    required double dashWidth,
    required double dashSpace,
  }) {
    final double totalDistance = (end - start).distance;
    final Offset direction = (end - start) / totalDistance;

    double currentDistance = 0;

    while (currentDistance < totalDistance) {
      final Offset dashStart = start + direction * currentDistance;
      final double remainingDistance = totalDistance - currentDistance;
      final double currentDashWidth = dashWidth > remainingDistance
          ? remainingDistance
          : dashWidth;

      final Offset dashEnd = dashStart + direction * currentDashWidth;

      canvas.drawLine(dashStart, dashEnd, paint);

      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
