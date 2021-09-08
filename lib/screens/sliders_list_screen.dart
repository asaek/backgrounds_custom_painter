import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _BotonNewList()),
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
      minWidth: size.width * 0.80,
      height: 70,
      child: MaterialButton(
        color: (appTheme.darkTheme)
            ? appTheme.currenTheme.accentColor
            : Color(0xffED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        onPressed: () {},
        child: Text(
          'Crear una nueva lista',
          style: TextStyle(
            color: appTheme.currenTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   // TODO el floating hace que regrese el encabezado de inmediato
        //   //  aun que la lista no haya terminado de recorrerse
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.blueAccent,
        //   title: Text('Hola perras'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 160,
            maxheight: 190,
            child: Container(
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Hola mundo',
            style: TextStyle(color: Color(0xff979185), fontSize: 50),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Stack(
            children: [
              Positioned(
                bottom: 6,
                child: Container(
                  width: 200,
                  height: 8,
                  color: Color(0xff979185),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 25),
                child: Text(
                  'List',
                  style: TextStyle(color: Color(0xff291f1d), fontSize: 40),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ListadeCosas extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', colorf: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', colorf: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', colorf: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', colorf: Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color colorf;

  const _ListItem({
    required this.titulo,
    required this.colorf,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : colorf,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
