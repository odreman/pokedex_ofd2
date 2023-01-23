import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/pokemon/grid/pokemon_grid_card_contents.dart';

import '../../../models/pokemon_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokeball_background.dart';

class PokemonGridCard extends StatelessWidget {
  const PokemonGridCard({
    Key? key,
    required this.pokemons,
    this.onPress,
  }) : super(key: key);

  final PokemonDetails pokemons;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: PokemonColors.pokeColorBackground(
            pokemons.types![0].type!.name.toString()),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: PokemonColors.pokeColorBackground(
                    pokemons.types![0].type!.name.toString())
                .withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: PokemonColors.pokeColorBackground(
              pokemons.types![0].type!.name.toString()),
          child: InkWell(
            onTap: onPress,
            splashColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade300,
            child: Stack(
              children: [
                pokeballBackground(height: 110),
                PokemonGridCardContents(
                    pokemons: pokemons, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
