import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  final String myText = 'We Love To Play!';

  List<Widget> listOfFrontLetter(String text) {
    var listOfLetter = text.split('');
    print(listOfLetter);
    return listOfLetter.map((letter) {
      return Text(
        letter,
        style: TextStyle(
          fontSize: 62.0,
          color: randomVisibility() > 0.5 ? Colors.transparent : Colors.black,
        ),
      );
    }).toList();
  }

  randomVisibility() {
    return Random().nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8dbfe9),
      body: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myText
                  .split('')
                  .map((e) => Text(
                        e,
                        style: TextStyle(
                          fontSize: 62.0,
                        ),
                      ))
                  .toList(),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0, end: MediaQuery.of(context).size.width),
              duration: Duration(milliseconds: 4000),
              builder: (context, double i, Widget child) {
                return CustomPaint(
                  size: Size(300, 300),
                  painter: LinePainter(
                    screenHeight: MediaQuery.of(context).size.height,
                    screenWidth: i,
                  ),
                );
              }),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listOfFrontLetter(myText),
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double screenHeight;
  double screenWidth;

  LinePainter({this.screenHeight, this.screenWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, screenHeight / 2);
    final p2 = Offset(screenWidth, screenHeight / 2);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
