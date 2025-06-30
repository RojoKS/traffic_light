import 'package:flutter/material.dart';

enum Lampe {
  gruen,
  gelb,
  rot,
  rotgelb,
}

class Ampel extends StatelessWidget {
  const Ampel({
    required this.lampe,
    required this.anordnung,
    this.umgekehrt = false,
    super.key,
  });

  const Ampel.rot({
    required this.anordnung,
    this.umgekehrt = false,
    super.key,
  }) : lampe = Lampe.rot;

  const Ampel.rotgelb({
    required this.anordnung,
    this.umgekehrt = false,
    super.key,
  }) : lampe = Lampe.rotgelb;

  const Ampel.gruen({
    required this.anordnung,
    this.umgekehrt = false,
    super.key,
  }) : lampe = Lampe.gruen;

  const Ampel.gelb({
    required this.anordnung,
    this.umgekehrt = false,
    super.key,
  }) : lampe = Lampe.gelb;

  final Lampe lampe;
  final Axis anordnung;
  final bool umgekehrt;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Flex(
      direction: anordnung,
      mainAxisSize: MainAxisSize.min,
      verticalDirection: umgekehrt
          ? VerticalDirection.up
          : VerticalDirection.down,
      textDirection: umgekehrt ? TextDirection.rtl : TextDirection.ltr,
      children: [
        Container(
          width: screenWidth * 0.062,
          height: screenHeight * 0.062,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lampe == Lampe.rot || lampe == Lampe.rotgelb
                ? Colors.red
                : Colors.black,
          ),
        ),
        Container(
          width: screenWidth * 0.062,
          height: screenHeight * 0.062,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lampe == Lampe.gelb || lampe == Lampe.rotgelb
                ? Colors.yellow
                : Colors.black,
          ),
        ),
        Container(
          width: screenWidth * 0.062,
          height: screenHeight * 0.062,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lampe == Lampe.gruen ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
