import 'package:flutter/material.dart';

import '../../utils/images.dart';

Widget pokeballBackground({required double height}) {
  final pokeballSize = height * 0.99;

  return Positioned(
    bottom: 0,
    right: 0,
    child: Image(
      image: AppGeneralImages.pokeballCard,
      width: pokeballSize,
      height: pokeballSize,
      color: Colors.white.withOpacity(0.4),
    ),
  );
}
