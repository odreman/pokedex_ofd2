import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/berries/slider/berry_slider_card_data.dart';

import '../../../models/pokemon_berry_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokeball_background.dart';

class BarrySliderCard extends StatelessWidget {
  final PokemonBerryDetails pokemonBerrys;
  final Function()? onPress;

  const BarrySliderCard({
    Key? key,
    required this.pokemonBerrys,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: InkWell(
        onTap: onPress,
        splashColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade300,
        child: Container(
          color: PokemonColors.gallery,
          width: 180,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              pokeballBackground(height: 60),
              BarrySliderCardData(
                  pokemonBerrys: pokemonBerrys, textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}
