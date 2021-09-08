import 'package:backgrounds_custom_painter/screens/launcher_tablet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:backgrounds_custom_painter/screens/screens.dart';
import 'models/models.dart';
import 'package:backgrounds_custom_painter/providers/providers.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderModer()),
        ChangeNotifierProvider(create: (_) => MenuModel()),
        ChangeNotifierProvider(create: (_) => MedicoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => TabletPorivder()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.currenTheme,
      title: 'Disenos App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          print('Orientacion $orientation');
          print('Ancho Pixeles Logicos:  ${screenSize.width}');
          print('Alto Pixeles Logicos:  ${screenSize.height}');

          // print(
          //     'Ratio de Pixeles Logicos:  ${MediaQuery.of(context).devicePixelRatio}');
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}


// apptheme.currenTheme.accentColor,
// apptheme.currenTheme.primaryColor,
// appTheme.scaffoldBackgroundColor
// appTheme.textTheme.bodyText1!.color,