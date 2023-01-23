import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget generations(String name) {
  Color color = PokemonColors.normalBackground;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(children: [
        Text(
          name.replaceAll('generation-', '').toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
        ),
      ]),
    ),
  );
}
