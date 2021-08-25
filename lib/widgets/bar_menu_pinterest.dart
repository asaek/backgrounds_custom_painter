import 'package:backgrounds_custom_painter/providers/MenuModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinteresButton {
  final IconData iconns;
  final Function() onPressedd;

  PinteresButton({
    required this.iconns,
    required this.onPressedd,
  });
}

class BarMenuPinterest extends StatelessWidget {
  final bool mostrar;

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactivdeColor;
  final List<PinteresButton> items;

  BarMenuPinterest({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blueAccent,
    this.inactivdeColor = Colors.cyan,
    required this.items,
  });

  // final List<PinteresButton> items = [
  //   PinteresButton(
  //       iconns: Icons.pie_chart,
  //       onPressedd: () {
  //         print('Icon Pie Chart');
  //       }),
  //   PinteresButton(
  //       iconns: Icons.search,
  //       onPressedd: () {
  //         print('Search');
  //       }),
  //   PinteresButton(
  //       iconns: Icons.notifications,
  //       onPressedd: () {
  //         print('Notificaciones');
  //       }),
  //   PinteresButton(
  //       iconns: Icons.supervised_user_circle,
  //       onPressedd: () {
  //         print('Supervised User Circle');
  //       }),
  // ];

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<MenuModel>(context).mostrar;
    // Provider.of<MenuModel>(context, listen: false).backgroundColor =
    //     this.backgroundColor!;

    Future.microtask(() {
      Provider.of<MenuModel>(context, listen: false).backgroundColor =
          this.backgroundColor!;
      Provider.of<MenuModel>(context, listen: false).activeColor =
          this.activeColor!;
      Provider.of<MenuModel>(context, listen: false).inactivdeColor =
          this.inactivdeColor!;
    });

    // print(mostrar);
    return AnimatedOpacity(
      duration: Duration(milliseconds: 250),
      opacity: (mostrar) ? 1 : 0,
      child: _PinterestMenuBackground(
        childIconos: _MenuItems(menuItems: items),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget childIconos;
  const _PinterestMenuBackground({required this.childIconos});

  @override
  Widget build(BuildContext context) {
    final providerBackgroundColor =
        Provider.of<MenuModel>(context).backgroundColor;

    return Container(
      child: childIconos,
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: providerBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinteresButton> menuItems;

  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) =>
            _PinteresMenuButtom(index: index, menuItem: menuItems[index]),
      ),
    );
  }
}

class _PinteresMenuButtom extends StatelessWidget {
  final int index;
  final PinteresButton menuItem;

  const _PinteresMenuButtom({
    required this.index,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final providerMenumodel = Provider.of<MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado = index;
        menuItem.onPressedd();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          menuItem.iconns,
          size: (providerMenumodel.itemSeleccionado == index) ? 30 : 20,
          color: (providerMenumodel.itemSeleccionado == index)
              ? providerMenumodel.activeColor
              : providerMenumodel.inactivdeColor,
        ),
      ),
    );
  }
}
