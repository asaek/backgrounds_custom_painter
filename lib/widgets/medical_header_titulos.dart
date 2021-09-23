import 'package:backgrounds_custom_painter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MedicalTitulosHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicoProvider = Provider.of<MedicoProvider>(context);

    print(medicoProvider.titulo);
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: double.infinity,
        ),
        Text(medicoProvider.titulo,
            style: TextStyle(fontSize: 20, color: medicoProvider.cruzColor)),
        SizedBox(
          height: 20,
        ),
        Text(
          medicoProvider.subTitulo,
          style: TextStyle(
              fontSize: 30,
              color: medicoProvider.cruzColor,
              fontWeight: FontWeight.bold),
        ),
        FaIcon(
          FontAwesomeIcons.plus,
          size: 100,
          color: medicoProvider.cruzColor,
        ),
      ],
    );
  }
}
