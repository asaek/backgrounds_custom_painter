import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradienteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color1 = Provider.of<MedicoProvider>(context).color1;
    final color2 = Provider.of<MedicoProvider>(context).color2;

    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
