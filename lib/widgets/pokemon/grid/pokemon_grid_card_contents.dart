import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../utils/spacer.dart';
import '../../generals/pokemon_image_cache.dart';
import '../../generals/pokemon_types.dart';

class PokemonGridCardContents extends StatelessWidget {
  const PokemonGridCardContents({
    Key? key,
    required this.pokemons,
    required this.textTheme,
  }) : super(key: key);

  final PokemonDetails pokemons;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: ClipRRect(
              child: Align(
            alignment: Alignment.topRight,
            child: Hero(
                tag: 'pokemon#${pokemons.id}',
                child: PokemonImageCache(
                    itemSize: 120, imageURL: pokemons.imageUrl)),
          )),
        ),
        Column(
          children: [
            const VSpacer(15),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
                  child: Text(
                    pokemons.name!.toUpperCase(),
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: pokemons.types!
                        .map((e) => PokemonTypes(e.type!.name, 10))
                        .toList(),
                  )),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    '#${pokemons.id}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
