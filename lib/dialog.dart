
import 'package:flutter/material.dart';



class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return CustomPaint(
      child: Container(


        height: height,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();



    path=Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70, size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    path.close();

    paint.color = Colors.orange[300];
    canvas.drawPath(path, paint);
    path=Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    paint.color = Colors.lightBlue[200];
    canvas.drawPath(path, paint);
    path=Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width*0.5, size.height*0.5);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.purple[200];
    canvas.drawPath(path, paint);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}