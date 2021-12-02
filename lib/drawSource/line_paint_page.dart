import 'package:flutter/material.dart';
import 'dart:math';


// Use to paint the hangman in every state
class LinePainter extends CustomPainter {
  final int state;

  LinePainter({required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    double factor = min(size.height, size.width) * 1;
    final linePaintBlack = Paint()
      ..color = Colors.grey.shade400
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    final linePaintRed = Paint()
      ..color = Colors.grey.shade300
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    final circlePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final eyePaint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final ropePaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    //base
    canvas.drawLine(
      Offset(factor * 0.2, factor * 9 / 10),
      Offset(factor * 1 / 3, factor * 9 / 10),
      linePaintBlack,
    );
    //pole
    canvas.drawLine(
      Offset(factor * 4 / 15, factor * 9 / 10),
      Offset(factor * 4 / 15, factor * 1 / 7),
      linePaintBlack,
    );
    //pole but horizontal???
    canvas.drawLine(
      Offset(factor * 4 / 15, factor * 1 / 7),
      Offset(factor * 75 / 100, factor * 1 / 7),
      linePaintBlack,
    );
    //rope
    canvas.drawLine(
      Offset(factor * 76 / 100, factor * 1 / 7),
      Offset(factor * 76 / 100, factor * 1 / 4),
      ropePaint,
    );
    //head
    if (state > 0 && state < 7) {
      canvas.drawCircle(
        Offset(factor * 61 / 80, factor * 66 / 200),
        factor * 1 / 14,
        circlePaint,
      );
    }
    //body
    if (state > 0 && state < 6) {
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 41 / 100),
        Offset(factor * 153 / 200, factor * 65 / 100),
        linePaintRed,
      );
    }
    //left arm
    if (state > 0 && state < 5) {
      canvas.drawLine(
        Offset(factor * 154 / 200, factor * 47 / 100),
        Offset(factor * 13 / 20, factor * 24 / 40),
        linePaintRed,
      );
    }
    //right arm
    if (state > 0 && state < 4) {
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 47 / 100),
        Offset(factor * 22 / 25, factor * 24 / 40),
        linePaintRed,
      );
    }
    //left leg
    if (state > 0 && state < 3) {
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 65 / 100),
        Offset(factor * 14 / 20, factor * 16 / 20),
        linePaintRed,
      );
    }
    //right leg
    if (state > 0 && state < 2) {
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 65 / 100),
        Offset(factor * 17 / 20, factor * 16 / 20),
        linePaintRed,
      );
      //eyes == gameOver
    }
    if (state <= 0) {
      canvas.drawLine(
        Offset(factor * 76 / 100, factor * 2 / 15),
        Offset(factor * 76 / 100, factor * 41 / 100),
        ropePaint,
      );
      //state head == death
      canvas.drawCircle(
        Offset(factor * 332 / 400, factor * 81 / 200),
        factor * 1 / 14,
        circlePaint,
      );
      //body
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 9 / 20),
        Offset(factor * 153 / 200, factor * 65 / 100),
        linePaintRed,
      );

      //left arm
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 47 / 100),
        Offset(factor * 29 / 40, factor * 26 / 40),
        linePaintRed,
      );

      //right arm
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 47 / 100),
        Offset(factor * 65 / 80, factor * 26 / 40),
        linePaintRed,
      );

      //left leg
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 65 / 100),
        Offset(factor * 15 / 20, factor * 17 / 20),
        linePaintRed,
      );

      //right leg
      canvas.drawLine(
        Offset(factor * 153 / 200, factor * 65 / 100),
        Offset(factor * 16 / 20, factor * 17 / 20),
        linePaintRed,
      );

      //right eye
      canvas.drawLine(
        Offset(factor * 79 / 100, factor * 75 / 200),
        Offset(factor * 83 / 100, factor * 77 / 200),
        eyePaint,
      );
      canvas.drawLine(
        Offset(factor * 161 / 200, factor * 80 / 200),
        Offset(factor * 162 / 200, factor * 72 / 200),
        eyePaint,
      );
      //left eye
      canvas.drawLine(
        Offset(factor * 82 / 100, factor * 84 / 200),
        Offset(factor * 86 / 100, factor * 86 / 200),
        eyePaint,
      );
      canvas.drawLine(
        Offset(factor * 168 / 200, factor * 89 / 200),
        Offset(factor * 169 / 200, factor * 82 / 200),
        eyePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}

