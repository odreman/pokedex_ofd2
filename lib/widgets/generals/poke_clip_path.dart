import 'package:flutter/material.dart';
import 'decoration_curve.dart';

class PokeClipPath extends StatelessWidget {
  const PokeClipPath({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final Color colors;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DecorationCurve(Colors.grey),
      child: Container(
        color: colors,
        height: 330,
      ),
    );
  }
}
