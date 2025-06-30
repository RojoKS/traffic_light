import 'package:flutter/material.dart';
import 'package:traffic_light/ampel.dart';
import 'package:traffic_light/strasse.dart';

class Kreuzung extends StatefulWidget {
  const Kreuzung({super.key});

  @override
  State<Kreuzung> createState() => _KreuzungState();
}

class _KreuzungState extends State<Kreuzung> {
  Ampel _schalteAmpel(Ampel ampel) {
    return switch (ampel.lampe) {
      Lampe.gruen => Ampel.gelb(
        umgekehrt: ampel.umgekehrt,
        anordnung: ampel.anordnung,
      ),
      Lampe.gelb => Ampel.rot(
        umgekehrt: ampel.umgekehrt,
        anordnung: ampel.anordnung,
      ),
      Lampe.rot => Ampel.rotgelb(
        umgekehrt: ampel.umgekehrt,
        anordnung: ampel.anordnung,
      ),
      Lampe.rotgelb => Ampel.gruen(
        umgekehrt: ampel.umgekehrt,
        anordnung: ampel.anordnung,
      ),
    };
  }

  void ampelnSchalten() {
    setState(() {
      ampelNord = _schalteAmpel(ampelNord);
      ampelSued = _schalteAmpel(ampelSued);
      ampelOst = _schalteAmpel(ampelOst);
      ampelWest = _schalteAmpel(ampelWest);
    });
  }

  // ampel farben default wert(welche an sind und welche aus.. noch statisch)
  Ampel ampelNord = Ampel(
    lampe: Lampe.rot,
    anordnung: Axis.vertical,
    umgekehrt: true,
  );
  Ampel ampelSued = Ampel(
    lampe: Lampe.rot,
    anordnung: Axis.vertical,
  );
  Ampel ampelOst = Ampel(
    lampe: Lampe.gruen,
    anordnung: Axis.horizontal,
  );
  Ampel ampelWest = Ampel(
    lampe: Lampe.gruen,
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
        Positioned(
          top: screenHeight * 0.185,
          left: screenWidth * 0.44,
          child: Container(
            width: 40,
            height: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 37, 170, 159),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_downward_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.185,
          right: screenWidth * 0.44,
          child: Container(
            width: 40,
            height: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 179, 0, 0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.44,
          left: screenWidth * 0.185,
          child: Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 74, 185, 77),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.44,
          right: screenWidth * 0.185,
          child: Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 35, 14, 112),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 40,
          ,
          child: ElevatedButton.icon(
            onPressed: () {
              ampelnSchalten();
            },
            icon: Icon(Icons.timer),
            label: Text('Ampel starten'),
          ),
        ),
      ],
    );
  }
}
