import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../utils/colors.dart';
import '../../generals/poke_animated_progress.dart';

class CardStats extends StatelessWidget {
  final PokemonDetails pokemon;

  const CardStats(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    double maxValue = pokemon.stats!
            .reduce((a, b) => a.baseStat! > b.baseStat! ? a : b)
            .baseStat! *
        1.0;

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Base Stats',
          style: TextStyle(
              color: PokemonColors.pokeColorBackground(
                  pokemon.types![0].type!.name),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      ...pokemon.stats!.map((e) {
        return Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: PokeAnimatedProgress(
                percentage: e.baseStat! * 1.0,
                label: e.stat!.name.toString(),
                stackValue: maxValue,
                defaultColor: Colors.grey,
                color: PokemonColors.getpokeColor(pokemon.types![0].type!.name),
              ),
            ));
      }).toList()
    ]);
  }
}
