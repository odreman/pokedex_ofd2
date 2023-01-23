import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget flavorType(String name, int potency) {
  Color color = PokemonColors.normalBackground;

  if (potency != 0) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(children: [
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            potency.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ]),
      ),
    );
  }
  return Container();
}
