import 'package:flutter/material.dart';

import '../../models/pokemon_details.dart';
import '../../utils/pokemon_sprites_url.dart';

//todo no se si utilizaré este archivo--revisar
class PokemonSpritesCardnoaun extends StatelessWidget {
  const PokemonSpritesCardnoaun({
    Key? key,
    required this.sprites,
    required this.color,
  }) : super(key: key);

  @required
  final Sprites sprites;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final List<PokemonSpritesUrl> pokemonSpritesUrl = [];
    return Container();
  }
}
