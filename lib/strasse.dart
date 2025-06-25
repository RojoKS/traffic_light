import 'package:flutter/material.dart';

class Strasse extends StatelessWidget {
  const Strasse({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: screenWidth * 0.63,
            height: screenHeight * 0.152,
          ),
          Container(
            color: Colors.grey,
            width: screenWidth * 0.152,
            height: screenHeight * 0.63,
          ),
        ],
      ),
    );
  }
}
