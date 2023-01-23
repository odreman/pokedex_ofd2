import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../models/pokemon_evolution_chain.dart';
import '../../../utils/colors.dart';
import '../../../utils/pokemon_evolution_family.dart';
import '../../generals/pokemon_image_cache.dart';
import '../../generals/title_card.dart';

class CardEvolution extends StatelessWidget {
  @required
  final PokemonDetails pokemon;
  @required
  final PokemonEvolutionChain? pokemonEvolution;

  const CardEvolution(this.pokemon, this.pokemonEvolution, {super.key});

  @override
  Widget build(BuildContext context) {
    if (pokemonEvolution == null) {
      return const SizedBox(height: 0);
    }

    List<EvolutionFamily> pokemonEvolutionList = [];
    String name = "";
    String url = "";
    String level = "";
    int order = 0;

    //order 1
    //Name
    name = pokemonEvolution?.chain?.species?.name == null
        ? ''
        : pokemonEvolution!.chain!.species!.name!;
    //Url
    url = pokemonEvolution?.chain?.species?.url == null
        ? ''
        : pokemonEvolution!.chain!.species!.url!;
    //Order
    order = 1;

    //save 1
    if (url.isNotEmpty) {
      pokemonEvolutionList
          .add(EvolutionFamily.prepareData(name, url, level, order));
    }

    //----------Order 2
    name = "";
    url = "";
    level = "";
    order = 2;

    if (pokemonEvolution!.chain!.evolvesTo != null &&
        pokemonEvolution!.chain!.evolvesTo!.isNotEmpty) {
      //Save name
      name = pokemonEvolution?.chain?.evolvesTo?[0]?.species?.name == null
          ? ''
          : pokemonEvolution!.chain!.evolvesTo![0]!.species!.name!;
      //Save url
      url = pokemonEvolution?.chain?.evolvesTo?[0]?.species?.url == null
          ? ''
          : pokemonEvolution!.chain!.evolvesTo![0]!.species!.url!;
      //save level
      level = pokemonEvolution
                  ?.chain?.evolvesTo?[0]?.evolutionDetails?[0]?.minLevel ==
              null
          ? ''
          : pokemonEvolution!
              .chain!.evolvesTo![0]!.evolutionDetails![0]!.minLevel!
              .toString();

      //Save
      if (url.isNotEmpty) {
        pokemonEvolutionList
            .add(EvolutionFamily.prepareData(name, url, level, order));
      }

      //order3
      name = "";
      url = "";
      level = "";
      order = 3;

      if (pokemonEvolution!.chain!.evolvesTo![0]!.evolvesTo!.isNotEmpty) {
        //Name
        name = pokemonEvolution
                    ?.chain?.evolvesTo?[0]?.evolvesTo?[0]?.species?.name ==
                null
            ? ''
            : pokemonEvolution!
                .chain!.evolvesTo![0]!.evolvesTo![0]!.species!.name!;

        //Url
        url = pokemonEvolution
                    ?.chain?.evolvesTo?[0]?.evolvesTo?[0]?.species?.url ==
                null
            ? ''
            : pokemonEvolution!
                    .chain!.evolvesTo![0]!.evolvesTo![0]!.species!.url ??
                '';
        if (pokemonEvolution!.chain!.evolvesTo![0]!.evolvesTo![0]!
            .evolutionDetails!.isNotEmpty) {
          //Level
          level = pokemonEvolution?.chain?.evolvesTo?[0]?.evolvesTo?[0]
                      ?.evolutionDetails?[0]?.minLevel ==
                  null
              ? ''
              : pokemonEvolution!.chain!.evolvesTo![0]!.evolvesTo![0]!
                  .evolutionDetails![0]!.minLevel!
                  .toString();
        }
      }

      //Save
      if (url.isNotEmpty) {
        pokemonEvolutionList
            .add(EvolutionFamily.prepareData(name, url, level, order));
      }
    } else {
      //return pokemonEvolutionList;
    }

    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          //Title
          setTitleCard('Evolution family',
              PokemonColors.pokeColorBackground(pokemon.types![0].type!.name)),

          Padding(
              padding: const EdgeInsets.only(top: 0),
              child: IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i in pokemonEvolutionList) ...[
                    //inicio row
                    Expanded(
                      child: _columnEvolutionCard(i.urlSprite,
                          i.name.toString().toUpperCase(), i.level),
                    ),
                    VerticalDivider(
                        color: PokemonColors.pokeColorBackground(
                            pokemon.types![0].type!.name),
                        thickness: 1),
                  ]
                ],
              )))
        ]));
  }
}

Widget _columnEvolutionCard(String imageUrl, String name, String level) {
  return Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: PokemonImageCache(itemSize: 80, imageURL: imageUrl),
      ),
      Align(
          alignment: Alignment.center,
          child: Text(name,
              style: const TextStyle(
                overflow: TextOverflow.fade,
                fontSize: 10,
                height: 1.3,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))),
      Align(
          alignment: Alignment.center,
          child: level == ""
              ? const Text('')
              : Text('Level up to $level',
                  style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 10,
                    height: 1.3,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ))),
    ],
  );
}
