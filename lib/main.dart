import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  final String myText = 'We Love To Play!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8dbfe9),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              myText,
              style: TextStyle(
                fontSize: 46.0,
              ),
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
              })
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
