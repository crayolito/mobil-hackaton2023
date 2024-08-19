import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<ui.Image> _loadImage(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final bytes = data.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  return frame.image;
}

class MarkerPainter extends CustomPainter {
  final ui.Image? image;

  MarkerPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) async {
    final greenPaint = Paint()
      ..color = Color.fromARGB(255, 10, 105, 13).withOpacity(.8);
    final whitePaint = Paint()..color = Colors.white;
    const double circleGreenRadius = 20;
    const double circleBlackRadius = 7;

    // Circulo Green
    canvas.drawCircle(
        Offset(circleGreenRadius, size.height - circleGreenRadius),
        circleGreenRadius,
        greenPaint);

    // Circulo White
    canvas.drawCircle(
        Offset(circleGreenRadius, size.height - circleGreenRadius),
        circleBlackRadius,
        whitePaint);

    // Dibujar Caja Blanca
    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);

    // Sombra
    canvas.drawShadow(path, Colors.black, 15, false);

    // Caja Green
    canvas.drawPath(path, greenPaint);

    // Dibujar la imagen
    if (image != null) {
      final offset = Offset(35, 20);
      canvas.drawImage(image!, offset, Paint());
    }

    // Caja Blanca
    const whiteBox = Rect.fromLTWH(140, 20, 200, 80);
    canvas.drawRect(whiteBox, whitePaint);

    //Textos
    final nombre = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      text: 'Comisaría Central',
    );

    final nombrePainter = TextPainter(
      text: nombre,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 200,
      );

    nombrePainter.paint(canvas, Offset(150, 25));

    final telefono = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      text: '+123 456 7890',
    );

    final telefonoPainter = TextPainter(
      text: telefono,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 200,
      );

    telefonoPainter.paint(canvas, Offset(150, 50));

    final atencionDias = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      text: ' Lunes a Viernes',
    );

    final atencionDiasPainter = TextPainter(
      text: atencionDias,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 200,
      );

    atencionDiasPainter.paint(canvas, Offset(150, 70));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return false;
  }
}
