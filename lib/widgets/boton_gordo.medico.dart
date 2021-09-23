import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordoMedico extends StatelessWidget {
  final IconData iconData;
  final String? texto;
  final Color? color1;
  final Color? color2;
  final VoidCallback? onPress;

  const BotonGordoMedico({
    required this.iconData,
    this.texto,
    this.color1,
    this.color2,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final FaIcon chevronRight =
        FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white);

    return GestureDetector(
      child: Stack(
        children: [
          _BotonGordoBackground(
            iconData: iconData,
            color1: color1,
            color2: color2,
            onPress: onPress!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(iconData, color: Colors.white, size: 70),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  texto!,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              chevronRight,
              SizedBox(
                width: 40,
              )
            ],
          )
        ],
      ),
      onTap: this.onPress,
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData? iconData;
  final Color? color1;
  final Color? color2;
  final VoidCallback onPress;

  const _BotonGordoBackground({
    this.iconData,
    this.color1,
    this.color2,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            color1!,
            color2!,
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  iconData,
                  size: 150,
                  color: Colors.white.withOpacity(0.3),
                ))
          ],
        ),
      ),
    );
  }
}
