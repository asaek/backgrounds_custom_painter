import 'package:backgrounds_custom_painter/models/models.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowList extends StatelessWidget {
  final List<Widget> slidesList;
  final bool dotsArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double? dotActivo;
  final double? dotDesactivado;

  const SlideShowList({
    required this.slidesList,
    this.dotsArriba = false,
    this.colorPrimario = Colors.grey,
    this.colorSecundario = Colors.lightBlue,
    this.dotActivo,
    this.dotDesactivado,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<SliderModer>(context).colorPrimario = this.colorPrimario!;
    Provider.of<SliderModer>(context).colorSecundario = this.colorSecundario!;
    Provider.of<SliderModer>(context).dotActivo = this.dotActivo!;
    Provider.of<SliderModer>(context).dotDesactivado = this.dotDesactivado!;

    return SafeArea(
      child: Column(
        children: [
          if (this.dotsArriba)
            _Dots(
              dotsTotalSlidesList: this.slidesList.length,
            ),
          Expanded(
            child: _Slides(slidesList: this.slidesList),
          ),
          if (!this.dotsArriba)
            _Dots(
              dotsTotalSlidesList: this.slidesList.length,
            ),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int dotsTotalSlidesList;

  const _Dots({
    required this.dotsTotalSlidesList,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            this.dotsTotalSlidesList,
            (index) => _Dot(
                  posicion: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int posicion;

  const _Dot({
    required this.posicion,
  });

  @override
  Widget build(BuildContext context) {
    // final pageViewPosicion = Provider.of<SliderModer>(context).currentPage;
    final slideShowModell = Provider.of<SliderModer>(context);
    double? tamanoo;
    Color? color;

    if (slideShowModell.currentPage >= posicion - 0.5 &&
        slideShowModell.currentPage <= posicion + 0.5) {
      tamanoo = slideShowModell.dotActivo;
      color = slideShowModell.colorSecundario;
    } else {
      tamanoo = slideShowModell.dotDesactivado;
      color = slideShowModell.colorPrimario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamanoo,
      height: tamanoo,
      margin: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

// /////////////////////////////////////////////////////////////////////////////////

class _Slides extends StatefulWidget {
  final List<Widget> slidesList;

  const _Slides({required this.slidesList});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      print('Pagina actual ${pageViewController.page}');

      Provider.of<SliderModer>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      scrollDirection: Axis.horizontal,
      // children: [
      //   _Slide(
      //     svg: 'assets/slice1.svg',
      //   ),
      //   _Slide(
      //     svg: 'assets/slice2.svg',
      //   ),
      //   _Slide(
      //     svg: 'assets/slice3.svg',
      //   ),
      //   _Slide(
      //     svg: 'assets/slice4.svg',
      //   ),
      // ],

      children: widget.slidesList
          .map((slideList) => _Slide(slide: slideList))
          .toList(),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
///
///
class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: slide,
    );
  }
}
