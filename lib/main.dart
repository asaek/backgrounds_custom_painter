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
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenos App',
      home: PinteresPage(),
    );
  }
}
