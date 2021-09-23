import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:backgrounds_custom_painter/routes/routes.dart';
import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:backgrounds_custom_painter/screens/screens.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);
    final size = MediaQuery.of(context).size;

    final Widget pageSliderProvider =
        Provider.of<TabletPorivder>(context).rutaSliderSeleccionada;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dise;os en Flutter -- TABLET --'),
        backgroundColor: apptheme.currenTheme.accentColor,
      ),
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: size.width * 0.28,
            child: _ListaOpciones(dondeLoLLaman: true),
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: (apptheme.darkTheme)
                ? Colors.grey
                : apptheme.currenTheme.accentColor,
          ),
          Expanded(
            child: pageSliderProvider,
          ),
        ],
      ),
      drawer: _MenuPrincipal(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: apptheme.currenTheme.accentColor,
                child: Text(
                  'AP',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _ListaOpciones(dondeLoLLaman: false),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline,
                color: apptheme.currenTheme.accentColor),
            title: Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: apptheme.currenTheme.accentColor,
              value: apptheme.darkTheme,
              onChanged: (value) => apptheme.darkTheme = value,
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen,
                color: apptheme.currenTheme.accentColor),
            title: Text('Custom Theme'),
            trailing: Switch.adaptive(
              activeColor: apptheme.currenTheme.accentColor,
              value: apptheme.customTheme,
              onChanged: (value) => apptheme.customTheme = value,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  final bool dondeLoLLaman;

  const _ListaOpciones({required this.dondeLoLLaman});
  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: apptheme.currenTheme.primaryColor,
      ),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: apptheme.currenTheme.accentColor,
        ),
        title: Text(pageRoutes[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: apptheme.currenTheme.accentColor,
        ),
        onTap: () {
          if (dondeLoLLaman) {
            Provider.of<TabletPorivder>(context, listen: false)
                .rutaSliderSeleccionada = pageRoutes[i].page;
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page),
            );
          }
        },
      ),
    );
  }
}
