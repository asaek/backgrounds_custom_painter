import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:backgrounds_custom_painter/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context).currenTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dise;os en Flutter --  Telefono --'),
        backgroundColor: apptheme.accentColor,
      ),
      body: Center(
        child: _ListaOpciones(),
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
            child: _ListaOpciones(),
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
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}
