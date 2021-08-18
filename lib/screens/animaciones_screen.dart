import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  // Puede a ver mas controller con el
  // Con este SingleTickerProviderStateMixin se soluciona el erro del
  // vsync: this,

  AnimationController? controller;
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;
  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

// el CurvedAnimation es para darle un tipo de animacion y el interval es el tiempo dentro del tiempo del controller
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.slowMiddle,
    ));
    // el interval es para tener una micro animacion marca un intervalo porcentual para haceer otra animacion
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.0,
          0.95,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
//  Recuerda que los valores de Tween son los valores aplicables a la animacion distancia giro etc no al tiempo
    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller!,
      curve: Interval(
        0.75,
        1.0,
      ),
    ));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller!);

    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller!);

    // Con esto puedes sasber en que estado esta la animacion si ya termino o esta en curso etc
    controller!.addListener(() {
      // print('Status: ${controller!.status}');
      if (controller!.status == AnimationStatus.completed) {
        controller!.reverse();
      }
      // else if (controller!.status == AnimationStatus.dismissed) {
      //   controller!.forward();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      // Si lo pasas por aca (propiedad child) solo se construye una ves se pasa por referencia
      // Si lo asignas al child se estara construyendo siempre por el build si es un widget muy pesado
      // es una muy buena idea           child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        //  De esta manera puedes saber cuando termina una animacion aunque esten en el mismo controllador
        print('Opacidad: ${opacidad!.value}');
        print('Rotacion: ${rotacion!.value}');

        return Transform.translate(
          offset: Offset(moverDerecha!.value, 0),
          child: Transform.rotate(
            angle: rotacion!.value,
            child: Opacity(
              opacity: opacidad!.value - opacidadOut!.value,
              child: Transform.scale(
                  scale: agrandar!.value, child: childRectangulo),
            ),
          ),
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
