import 'package:flutter/material.dart';

class DecorationCurve extends CustomClipper<Path> {
  MaterialColor color;

  DecorationCurve(this.color);

  @override
  Path getClip(Size size) {
    int curveHeight = 10;
    Offset controlPoint =
        Offset(size.width / 2, (size.height + curveHeight) * .88);
    Offset endPoint = Offset(size.width, (size.height - curveHeight) * .48);

    Path path = Path()
      ..lineTo(-100, 250)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
