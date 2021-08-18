import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _RectanguloAnimado(),
      ),
    );
  }
}

class _RectanguloAnimado extends StatefulWidget {
  @override
  __RectanguloAnimadoState createState() => __RectanguloAnimadoState();
}

class __RectanguloAnimadoState extends State<_RectanguloAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? traslacionDerecha;
  Animation<double>? traslacionArriba;
  Animation<double>? traslacionIzquierda;
  Animation<double>? traslacionAbajo;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 4500,
      ),
    );

    traslacionDerecha = Tween(
      begin: 0.0,
      end: 170.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.0,
          0.25,
          curve: Curves.bounceOut,
        ),
      ),
    );

    traslacionArriba = Tween(
      begin: 0.0,
      end: 170.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.25,
          0.50,
          curve: Curves.bounceOut,
        ),
      ),
    );

    traslacionIzquierda = Tween(
      begin: 0.0,
      end: 170.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.50,
          0.75,
          curve: Curves.bounceOut,
        ),
      ),
    );
    traslacionAbajo = Tween(
      begin: 0.0,
      end: 170.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.76,
          1.0,
          curve: Curves.bounceOut,
        ),
      ),
    );
    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childObjeto) {
        return Transform.translate(
          offset: Offset(traslacionDerecha!.value - traslacionIzquierda!.value,
              0.0 - traslacionArriba!.value + traslacionAbajo!.value),
          child: childObjeto,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
