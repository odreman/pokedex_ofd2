import 'package:flutter/material.dart';

import '../../utils/images.dart';

class PokeballDecoration extends StatelessWidget {
  @required
  final Size screenSize;
  @required
  final double safeAreaTop;
  @required
  final Color color;

  const PokeballDecoration(
      {super.key,
      required this.screenSize,
      required this.safeAreaTop,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final pokeSize = screenSize.width * 0.33;
    final appBarHeight = screenSize.width * 0.45;
    final pokeballTopMargin =
        -(pokeSize / 1.5 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = screenSize.height * 0.005;

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: IgnorePointer(
        ignoring: true,
        child: Stack(children: [
          Image(
            image: AppGeneralImages.pokeballCard,
            width: pokeSize,
            height: pokeSize,
            color: Colors.white24,
          ),
        ]),
      ),
    );
  }
}

Widget buildBackground(Color color) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    constraints: const BoxConstraints.expand(),
    color: color,
  );
}
