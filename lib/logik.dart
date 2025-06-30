import 'package:flutter/material.dart';
import 'package:traffic_light/ampel.dart';
import 'package:traffic_light/strasse.dart';
import 'package:traffic_light/kreuzung.dart';

enum KreuzungsPhase {
  nordSuedGruen,
  nordSuedGelb,
  ostWestGruen,
  ostWestGelb,
  alleRot,
}

class KreuzungsZustand {
  final KreuzungsPhase aktuellePhase;
  KreuzungsZustand({
    required this.aktuellePhase,
  });
}
