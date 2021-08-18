import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgresspage extends StatefulWidget {
  @override
  _CircularProgresspageState createState() => _CircularProgresspageState();
}

class _CircularProgresspageState extends State<CircularProgresspage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  double? porcentaje = 0;
  double? nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 800,
      ),
    );

    controller!.addListener(() {
      // print('Valor controller: ${controller!.value}');

      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller!.value);
      print('Porcentaje:  $porcentaje');
      print('Nuevo Porcentaje:  $nuevoPorcentaje');
      print('Controller:  ${controller!.value}');

      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            // padding: EdgeInsets.all(),
            width: 300,
            height: 300,
            color: Colors.black12,
            child: CustomPaint(
              painter: _MiRadialProgress(porcentaje),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje = nuevoPorcentaje! + 5;
            if (nuevoPorcentaje! > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            // Ese  from: 0.0 es desde donde quieres empezar la animacion
            controller!.forward(from: 0.0);
            setState(() {});
          },
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paintCirculo = new Paint()
      ..strokeWidth = 1
      ..color = Colors.black38
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paintCirculo);

    final paintArco = new Paint()
      ..strokeWidth = 4
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      // El espacio donde queremos hubicar esta wea
      //Se estan tomando los valores del otro circulo
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
