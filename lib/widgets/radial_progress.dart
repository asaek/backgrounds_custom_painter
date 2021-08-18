import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgrees extends StatefulWidget {
  final porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;

  const RadialProgrees({
    required this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
  });

  @override
  _RadialProgreesState createState() => _RadialProgreesState();
}

class _RadialProgreesState extends State<RadialProgrees>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double? porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller!.value),
                  widget.colorPrimario,
                  widget.colorSecundario),
            ),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  Color? colorPrimario;
  Color? colorSecundario;
  // Argumentos posicionales creo  que se refiere a que solo se envia el valor y no la referencia
  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180,
    );

    final Gradient gradiente = new LinearGradient(colors: <Color>[
      Color(0xffc012ff),
      Color(0xff6d05e8),
      Colors.red,
    ]);

    if (colorSecundario == null) {
      this.colorSecundario = Colors.grey;
    }
    if (colorPrimario == null) {
      this.colorPrimario = Colors.lightBlueAccent;
    }

    final paintCirculo = new Paint()
      ..strokeWidth = 1
      ..color = colorSecundario!
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paintCirculo);

    final paintArco = new Paint()
      ..strokeWidth = 8
      // ..color = colorPrimario!
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

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
