import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xFF615AAB),
    );
  }
}

class HeaderBodesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Color(0xFF615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderOlasGradiente(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 40;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class _HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 40;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    // path.moveTo(0, size.height * 0.5);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 40;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    // path.moveTo(0, size.height * 0.5);
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width * 0.50, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    path.lineTo(0, 0);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    // path.moveTo(0, size.height * 0.5);
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.60, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class _HeaderOlas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.80);

    // path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.90,
      size.width * 0.50,
      size.height * 0.80,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.70,
      size.width,
      size.height * 0.80,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.80);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class _HeaderOlasGradiente extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 50.0),
      radius: 300,
    );
    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        // Colors.white54,
        Colors.amber,
        Colors.tealAccent,
      ],
      // stops: [
      //   0.2,
      //   0.5,
      //   1.0,
      // ],
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    //        .fill      rellena la figura pintada
    //        .stroke     va pintando los bordes es como las lineas de un lapiz

    final path = new Path();

    // Dibujar con el path y el lapiz

    // path.moveTo(0, size.height * 0.80);

    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.40,
      size.width * 0.50,
      size.height * 0.35,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.30,
      size.width,
      size.height * 0.35,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.80);

    // print(size.height);
    // print(size.width);

    // Pintar
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw true;
  }
}
