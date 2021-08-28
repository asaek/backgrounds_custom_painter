import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/widgets/widgets.dart';
import 'package:backgrounds_custom_painter/providers/providers.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  final FaIcon iconData;
  final String titulo;
  final String subtitulo;
  final Color? color1;
  final Color? color2;
  final Color? cruzColor;

  const EmergencyScreen({
    required this.iconData,
    required this.titulo,
    required this.subtitulo,
    this.color1,
    this.color2,
    this.cruzColor,
  });

  @override
  Widget build(BuildContext context) {
    // final Color colorBlanco = Colors.white.withOpacity(0.7);

    Future.microtask(() {
      if (this.color1 != null) {
        Provider.of<MedicoProvider>(context, listen: false).color1 =
            this.color1!;
        Provider.of<MedicoProvider>(context, listen: false).color2 =
            this.color2!;
      }
      if (this.cruzColor != null) {
        Provider.of<MedicoProvider>(context, listen: false).cruzColor =
            this.cruzColor!;
      }
      Provider.of<MedicoProvider>(context, listen: false).titulo = this.titulo;
      Provider.of<MedicoProvider>(context, listen: false).subTitulo =
          this.subtitulo;
      print(titulo);
    });

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((i) => FadeInLeft(
              duration: Duration(
                milliseconds: 400,
              ),
              child: BotonGordoMedico(
                iconData: i.icon,
                texto: i.texto,
                color1: i.color1,
                color2: i.color2,
                onPress: () {
                  print('Hola wey');
                },
              ),
            ))
        .toList();
    return Scaffold(
      // body: HeaderEmemregency(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                // SizedBox(
                //   height: 250,
                // ),

                //Operador Spread
                ...itemMap
              ],
            ),
          ),
          // TODO arreglar como le envio los parametros al header ya que lo esty haciendo por provider
          // TODO pero no hay como darselos al provider jajajaja
          HeaderEmemregency(),
        ],
      ),
      // backgroundColor: Colors.amberAccent,
    );
  }
}

// class BotonGordoTemp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BotonGordoMedico(
//       iconData: ,
//       onPress: () {
//         print('Hla bb');
//       },
//       texto: Expanded(
//         child: Text(
//           'Motor Accident',
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       ),
//       color1: Color(0xff979185),
//       color2: Color(0xff291F1D),
//     );
//   }
// }
