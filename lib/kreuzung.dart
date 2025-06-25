import 'package:flutter/material.dart';
import 'package:traffic_light/ampel.dart';
import 'package:traffic_light/strasse.dart';
import 'package:traffic_light/main.dart';
import 'package:traffic_light/logik.dart';

class Kreuzung extends StatefulWidget {
  const Kreuzung({super.key});

  @override
  State<Kreuzung> createState() => _KreuzungState();
}

class _KreuzungState extends State<Kreuzung> {
  void ampelSchalten() {
    setState(() {
      if (ampelNord.lampeGruen) {
        ampelNord = Ampel.gelb();
      } else if (ampelNord.lampeGelb && ampelNord.lampeRot) {
        ampelNord = Ampel.gruen();
      } else if (ampelNord.lampeRot) {
        ampelNord = Ampel.rotgelb();
      } else if (ampelNord.lampeGelb) {
        ampelNord = Ampel.rot();
      }

      if (ampelSued.lampeGruen) {
        ampelSued = Ampel.gelb(
          umgekehrt: ampelSued.umgekehrt,
        );
      } else if (ampelSued.lampeGelb && ampelSued.lampeRot) {
        ampelSued = Ampel.gruen(
          umgekehrt: ampelSued.umgekehrt,
        );
      } else if (ampelSued.lampeRot) {
        ampelSued = Ampel.rotgelb(
          umgekehrt: ampelSued.umgekehrt,
        );
      } else if (ampelSued.lampeGelb) {
        ampelSued = Ampel.rot(
          umgekehrt: ampelSued.umgekehrt,
        );
      }

      if (ampelWest.lampeRot) {
        ampelWest = Ampel.gelb(
          anordnung: ampelWest.anordnung,
        );
      } else if (ampelWest.lampeGelb) {
        ampelWest = Ampel.rotgelb(
          anordnung: ampelWest.anordnung,
        );
      } else if (ampelWest.lampeGelb && ampelWest.lampeRot) {
        ampelWest = Ampel.rot(
          anordnung: ampelWest.anordnung,
        );
      } else if (ampelWest.lampeGruen) {
        ampelWest = Ampel.gruen(
          anordnung: ampelWest.anordnung,
        );
      }

      if (ampelOst.lampeRot) {
        ampelOst = Ampel.gelb(
          anordnung: ampelOst.anordnung,
          umgekehrt: ampelOst.umgekehrt,
        );
      } else if (ampelOst.lampeGelb) {
        ampelOst = Ampel.rotgelb(
          anordnung: ampelOst.anordnung,
          umgekehrt: ampelOst.umgekehrt,
        );
      } else if (ampelOst.lampeGelb && ampelOst.lampeRot) {
        ampelOst = Ampel.rot(
          anordnung: ampelOst.anordnung,
          umgekehrt: ampelOst.umgekehrt,
        );
      } else if (ampelOst.lampeGruen) {
        ampelOst = Ampel.gruen(
          anordnung: ampelOst.anordnung,
          umgekehrt: ampelOst.umgekehrt,
        );
      }
    });
  }

  // ampel farben(welche an sind und welche aus.. noch statisch)
  Ampel ampelNord = Ampel(
    lampeRot: true,
    lampeGelb: false,
    lampeGruen: false,
    anordnung: Axis.vertical,
  );
  Ampel ampelSued = Ampel(
    lampeRot: true,
    lampeGelb: false,
    lampeGruen: false,
    anordnung: Axis.vertical,
  );
  Ampel ampelOst = Ampel(
    lampeRot: false,
    lampeGelb: false,
    lampeGruen: true,
    anordnung: Axis.horizontal,
  );
  Ampel ampelWest = Ampel(
    lampeRot: false,
    lampeGelb: false,
    lampeGruen: true,
    anordnung: Axis.horizontal,
    umgekehrt: true,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // DESIGN UND POSITION
    return Stack(
      children: [
        Strasse(),
        Positioned(
          top: screenHeight * 0.23,
          left: screenWidth * 0.354,
          child: ampelNord,
        ),
        Positioned(
          bottom: screenHeight * 0.23,
          right: screenWidth * 0.354,
          child: ampelSued,
        ),
        Positioned(
          bottom: screenHeight * 0.354,
          left: screenWidth * 0.228,
          child: ampelWest,
        ),
        Positioned(
          top: screenHeight * 0.354,
          right: screenWidth * 0.228,
          child: ampelOst,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton.icon(
            onPressed: () {
              ampelSchalten();
            },
            icon: Icon(Icons.business),
            label: Text('Ampel starten'),
          ),
        ),
      ],
    );
  }
}
