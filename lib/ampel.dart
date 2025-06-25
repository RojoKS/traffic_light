import 'package:flutter/material.dart';

class Ampel extends StatelessWidget {
  const Ampel({
    this.lampeRot = false,
    this.lampeGelb = false,
    this.lampeGruen = false,
    this.anordnung = Axis.horizontal,
    this.umgekehrt = true,
    super.key,
  });

  const Ampel.rot({
    this.lampeRot = true,
    this.lampeGelb = false,
    this.lampeGruen = false,
    this.anordnung = Axis.vertical,
    this.umgekehrt = false,
    super.key,
  });
  const Ampel.rotgelb({
    this.lampeRot = true,
    this.lampeGelb = true,
    this.lampeGruen = false,
    this.anordnung = Axis.vertical,
    this.umgekehrt = false,
    super.key,
  });
  const Ampel.gruen({
    this.lampeRot = false,
    this.lampeGelb = false,
    this.lampeGruen = true,
    this.anordnung = Axis.vertical,
    this.umgekehrt = true,
    super.key,
  });
  const Ampel.gelb({
    this.lampeRot = false,
    this.lampeGelb = true,
    this.lampeGruen = false,
    this.anordnung = Axis.vertical,
    this.umgekehrt = false,
    super.key,
  });

  final bool lampeRot;
  final bool lampeGelb;
  final bool lampeGruen;
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
            color: lampeRot ? Colors.red : Colors.black,
          ),
        ),
        Container(
          width: screenWidth * 0.062,
          height: screenHeight * 0.062,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lampeGelb ? Colors.yellow : Colors.black,
          ),
        ),
        Container(
          width: screenWidth * 0.062,
          height: screenHeight * 0.062,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lampeGruen ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
