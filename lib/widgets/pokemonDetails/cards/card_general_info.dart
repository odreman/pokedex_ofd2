import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../models/pokemon_species.dart';
import '../../../utils/colors.dart';
import '../../generals/animated_counter.dart';

class CardGeneralInfo extends StatelessWidget {
  @required
  final PokemonDetails pokemon;
  @required
  final PokemonSpecies pokemonSpecies;

  const CardGeneralInfo(this.pokemon, this.pokemonSpecies, {super.key});

  @override
  Widget build(BuildContext context) {
    VerticalDivider div = VerticalDivider(
      color: PokemonColors.pokeColorBackground(pokemon.types![0].type!.name),
      thickness: 3,
    );

    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'General',
              style: TextStyle(
                  color: PokemonColors.pokeColorBackground(
                      pokemon.types![0].type!.name),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _columnValueText('Height (Mts)', (pokemon.height! / 10)),
                  div,
                  _columnValueText('Weight (Kgs)', (pokemon.weight! / 10)),
                ],
              )))
        ]));
  }
}

Widget _columnValueText(String description, double value) {
  return Container(
    margin: const EdgeInsets.only(right: 15, left: 15),
    child: Column(
      children: [
        AnimatedCounter(value: value, primaryColor: Colors.grey),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
