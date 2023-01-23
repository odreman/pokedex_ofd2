import 'package:flutter/material.dart';
import '../../../models/pokemon_move_details.dart';

class MoveSliderCardContents extends StatelessWidget {
  const MoveSliderCardContents({
    Key? key,
    required this.pokemonMoves,
    required this.textTheme,
  }) : super(key: key);

  final PokemonMoveDetails pokemonMoves;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        width: MediaQuery.of(context).size.width * .55,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                pokemonMoves.name.toString().toUpperCase(),
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Power ${pokemonMoves.power.toString()}',
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]));
  }
}
