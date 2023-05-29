// ignore_for_file: public_member_api_docs

import "package:flutter/material.dart";

void main() => runApp(
      const MaterialApp(
        title: "RandomRGB",
        debugShowCheckedModeBanner: false,
        home: SolidRGB(),
      ),
    );

class SolidRGB extends StatefulWidget {
  const SolidRGB({Key? key}) : super(key: key);

  @override
  State<SolidRGB> createState() => SolidRGBState();
}

class SolidRGBState extends State<SolidRGB> {
  //arrey from 0 to 255 for random value generation
  List<int> rgbValues = List<int>.generate(256, (int index) => index++);

  //initial values of colors
  final alphaVal = 255;
  int redColor = 100;
  int greenColor = 120;
  int blueColor = 130;

  //random value generation (from 0 to 255)
  int randomValue() {
    rgbValues.shuffle();

    return rgbValues.first;
  }

  //function for mixing colors
  void mixRGB() {
    setState(() {
      redColor = randomValue();
      greenColor = randomValue();
      blueColor = randomValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          mixRGB();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(alphaVal, redColor, greenColor, blueColor),
          ),
          child: Center(child: Text('hello there'.toUpperCase())),
        ),
      ),
    );
  }
}
