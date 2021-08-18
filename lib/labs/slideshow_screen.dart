import 'package:backgrounds_custom_painter/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides(),
            ),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(posicion: 0),
          _Dot(posicion: 1),
          _Dot(posicion: 2),
          _Dot(posicion: 3),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int posicion;

  const _Dot({required this.posicion});

  @override
  Widget build(BuildContext context) {
    final pageViewPosicion = Provider.of<SliderModer>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: (pageViewPosicion >= posicion - 0.5 &&
              pageViewPosicion <= posicion + 0.5)
          ? 20
          : 10,
      height: (pageViewPosicion >= posicion - 0.5 &&
              pageViewPosicion <= posicion + 0.5)
          ? 20
          : 10,
      margin: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: (pageViewPosicion >= posicion - 0.5 &&
                pageViewPosicion <= posicion + 0.5)
            ? Colors.blue
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
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
      children: [
        _Slide(
          svg: 'assets/slice1.svg',
        ),
        SvgPicture.asset('assets/slice2.svg'),
        SvgPicture.asset('assets/slice3.svg'),
        SvgPicture.asset('assets/slice4.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SvgPicture.asset(svg),
    );
  }
}
