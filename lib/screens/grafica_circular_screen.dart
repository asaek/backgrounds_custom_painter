import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:backgrounds_custom_painter/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesScreen extends StatefulWidget {
  @override
  _GraficasCircularesScreenState createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.blueGrey,
              ),
              _CustomRadialProgress(
                porcentaje: porcentaje * 1.2,
                colorPrimario: Colors.deepPurple,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(
                porcentaje: porcentaje * 1.4,
                colorPrimario: Colors.pinkAccent,
              ),
              _CustomRadialProgress(
                porcentaje: porcentaje * 1.6,
                colorPrimario: Colors.cyanAccent,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_outlined),
        onPressed: () {
          setState(() {
            porcentaje = porcentaje + 5;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress({
    required this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
  });

  final double porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;
    return Container(
      width: 200,
      height: 200,
      child: RadialProgrees(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: appTheme.textTheme.bodyText1!.color,
      ),
    );
  }
}
