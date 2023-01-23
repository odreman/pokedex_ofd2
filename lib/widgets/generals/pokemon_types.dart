import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class PokemonTypes extends StatelessWidget {
  @required
  String type;
  double sizeText;

  PokemonTypes(this.type, this.sizeText, {super.key}) {
    type = type;
    sizeText = sizeText;
  }

  @override
  Widget build(BuildContext context) {
    Color color = PokemonColors.getpokeColor(type);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: sizeText,
          ),
        ),
      ),
    );
  }
}
