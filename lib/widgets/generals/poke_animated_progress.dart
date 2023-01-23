import 'package:flutter/material.dart';

class PokeAnimatedProgress extends StatelessWidget {
  final double percentage;
  final String label;
  final Color defaultColor;
  final Color color;
  final double stackValue;

  const PokeAnimatedProgress(
      {required this.percentage,
      required this.label,
      required this.stackValue,
      super.key,
      required this.defaultColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: const Duration(seconds: 2),
        builder: (context, double value, child) => Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                    color: defaultColor, fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(
                flex: 1,
                child: Text((value).toInt().toString(),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center)),
            Expanded(
              flex: 2,
              child: LinearProgressIndicator(
                value: value / stackValue,
                color: color,
                backgroundColor: defaultColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
