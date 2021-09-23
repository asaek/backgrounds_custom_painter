import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:backgrounds_custom_painter/providers/providers.dart';

class HeaderEmemregency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cruzColor =
        Provider.of<MedicoProvider>(context, listen: false).cruzColor;

    return Stack(
      children: [
        GradienteBackground(),
        Positioned(
          left: -50,
          top: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: cruzColor.withOpacity(0.2),
          ),
        ),
        MedicalTitulosHeader(),
        Positioned(
          top: 10,
          right: -10,
          child: SafeArea(
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
