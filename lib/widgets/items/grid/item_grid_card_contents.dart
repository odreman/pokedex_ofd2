import 'package:flutter/material.dart';

import '../../../models/pokemon_items_details.dart';
import '../../../utils/spacer.dart';
import '../../generals/pokemon_image_cache.dart';
import '../item_category.dart';

class ItemGridCardContents extends StatelessWidget {
  const ItemGridCardContents({
    Key? key,
    required this.pokemonItems,
    required this.textTheme,
  }) : super(key: key);

  final PokemonItemsDetails pokemonItems;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSpacer(15),
        ClipRRect(
            child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: PokemonImageCache(
                itemSize: 30, imageURL: pokemonItems.sprites.spritesDefault!),
          ),
        )),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                pokemonItems.name.toUpperCase(),
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: ItemCategory(pokemonItems.category.name.toLowerCase()),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                '#${pokemonItems.id}',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }
}
