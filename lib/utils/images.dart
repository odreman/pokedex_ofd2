import 'package:flutter/material.dart';

const String _imagePathAssets = 'assets';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePathAssets/$fileName');
}

class AppGeneralImages {
  static const pokeballCard = _Image('pokeball.png');
  static const noImage = _Image('no-image.jpg');
  static const loadingImage = _Image('loading.gif');
  static const pokeballColor = _Image('pokeballcolor.png');
  static const dotted = _Image('dotted.png');
  static const female = _Image('female.png');
  static const male = _Image('male.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(pokeballCard, context);
  }
}
