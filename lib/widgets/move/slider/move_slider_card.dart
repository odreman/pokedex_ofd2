import 'package:flutter/material.dart';

import '../../../models/pokemon_move_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokeball_background.dart';
import 'move_slider_card_contents.dart';

class MoveSliderCard extends StatelessWidget {
  final PokemonMoveDetails pokemonMoves;
  final Function()? onPress;

  const MoveSliderCard({Key? key, required this.pokemonMoves, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: PokemonColors.gallery,
        width: size.width * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: onPress,
          splashColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade300,
          child: Stack(
            children: [
              pokeballBackground(height: 110),
              MoveSliderCardContents(
                  pokemonMoves: pokemonMoves, textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}
