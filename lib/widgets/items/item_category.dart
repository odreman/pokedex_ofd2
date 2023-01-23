import 'package:flutter/material.dart';

import '../../utils/spacer.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory(
    this.name, {
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: Material(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Colors.black26.withOpacity(0.25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                name,
                textScaleFactor: 1,
                style: const TextStyle(
                  fontSize: 10,
                  height: 0.8,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const HSpacer(5),
            ],
          ),
        ),
      ),
    );
  }
}
