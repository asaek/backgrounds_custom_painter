import 'package:flutter/material.dart';
import 'package:backgrounds_custom_painter/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final sizeHeight = MediaQuery.of(context).size.height;
    bool isToLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isToLarge = true;
    } else {
      isToLarge = false;
    }

    return Scaffold(
      body: (isToLarge)
          ? Column(children: [
              Expanded(
                flex: 5,
                child: MiSlideshow(),
              ),
              Expanded(
                flex: 5,
                child: MiSlideshow(),
              ),
            ])
          : Row(children: [
              Expanded(
                flex: 5,
                child: MiSlideshow(),
              ),
              Expanded(
                flex: 5,
                child: MiSlideshow(),
              ),
            ]),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideShowList(
      dotActivo: 20,
      dotDesactivado: 10,
      // dotsArriba: true,
      // colorPrimario: Colors.rno pues aed,
      // colorSecundario: Colors.purpleAccent,
      // Con esto puedes enviar lo que quieras mientras sea un Widget
      slidesList: [
        SvgPicture.asset('assets/slice1.svg'),
        SvgPicture.asset('assets/slice2.svg'),
        SvgPicture.asset('assets/slice3.svg'),
        SvgPicture.asset('assets/slice4.svg'),
        SvgPicture.asset('assets/slice1.svg'),
      ],
    );
  }
}
