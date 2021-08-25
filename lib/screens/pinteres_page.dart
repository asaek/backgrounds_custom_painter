import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:backgrounds_custom_painter/widgets/widgets.dart';
import 'package:backgrounds_custom_painter/providers/providers.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _PinteresWidget(),
          _PinteresMenuLocation(),
        ],
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    final tamano = MediaQuery.of(context).size;
    // print('Ancho: ${tamano.width}');
    // print('Alto: ${tamano.height}');
    // print('Centro: ${tamano.center(Offset(0, 0))}');

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: BarMenuPinterest(
            items: [
              PinteresButton(
                  iconns: Icons.pie_chart,
                  onPressedd: () {
                    print('Icon Pie Chart');
                  }),
              PinteresButton(
                  iconns: Icons.search,
                  onPressedd: () {
                    print('Search');
                  }),
              PinteresButton(
                  iconns: Icons.notifications,
                  onPressedd: () {
                    print('Notificaciones');
                  }),
              PinteresButton(
                  iconns: Icons.supervised_user_circle,
                  onPressedd: () {
                    print('Supervised User Circle');
                  }),
            ],
            // backgroundColor: Colors.red,
            // activeColor: Colors.purpleAccent,
            // inactivdeColor: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}

class _PinteresWidget extends StatefulWidget {
  @override
  __PinteresWidgetState createState() => __PinteresWidgetState();
}

class __PinteresWidgetState extends State<_PinteresWidget> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      // print('controller.offset ${controller.offset}');
      // print('scrollAnterior $scrollAnterior');
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        // print('Estas bajando');
        Provider.of<MenuModel>(context, listen: false).mostrar = false;
      } else {
        // print('Estas Subiendo');
        Provider.of<MenuModel>(context, listen: false).mostrar = true;
      }
      if (scrollAnterior == controller.offset) {
        Provider.of<MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;

      // print({Provider.of<MenuModel>(context, listen: false).mostrar});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // este es el grip del widget plugin de yaml
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          ConteinerForGrid(index: index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class ConteinerForGrid extends StatelessWidget {
  final int index;

  const ConteinerForGrid({required this.index});

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: EdgeInsets.all(5),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}
