import 'package:flutter/material.dart';

import '../../../models/pokemon_berry_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokeball_background.dart';
import 'berry_grid_card_contents.dart';

class BerryGridCard extends StatelessWidget {
  const BerryGridCard({
    Key? key,
    required this.pokemonBerry,
    this.onPress,
  }) : super(key: key);

  final PokemonBerryDetails pokemonBerry;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: PokemonColors.gallery,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: PokemonColors.gallery.withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: PokemonColors.gallery,
          child: InkWell(
            onTap: onPress,
            splashColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade300,
            child: Stack(
              children: [
                pokeballBackground(height: 110),
                BerryGridCardContents(
                    pokemonBerry: pokemonBerry, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
