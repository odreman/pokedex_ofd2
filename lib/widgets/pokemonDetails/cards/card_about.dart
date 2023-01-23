import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../models/pokemon_species.dart';
import '../../../utils/colors.dart';

class CardAbout extends StatelessWidget {
  @required
  final PokemonDetails pokemon;
  @required
  final PokemonSpecies pokemonSpecies;

  const CardAbout(this.pokemon, this.pokemonSpecies, {super.key});

  @override
  Widget build(BuildContext context) {
    var list = pokemonSpecies.flavorTextEntries!
        .where((x) => x.language!.name == 'en')
        .toSet()
        .toList();
    list = list.toSet().toList();

    String desc = '';
    StringBuffer description = StringBuffer();

    var it = list[list.length - 1].flavorText!.replaceAll("\n", " ");
    if (!desc.toString().toLowerCase().contains(it.toLowerCase())) {
      description.write('$it ');
      desc += '$it ';
    }

    String descriptionLastVersion =
        'Version ${list[list.length - 1].version!.name!}: $description';

    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'About',
              style: TextStyle(
                  color: PokemonColors.pokeColorBackground(
                      pokemon.types![0].type!.name),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    descriptionLastVersion.toString().replaceAll('\n', ' '),
                    maxLines: 4,
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 13,
                      height: 1.3,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
        ]));
  }
}
