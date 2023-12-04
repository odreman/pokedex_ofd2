import 'package:flutter/material.dart';

import '../../../models/pokemon_items_details.dart';
import '../../generals/pokemon_image_cache.dart';

class ItemsSliderCardContents extends StatelessWidget {
  const ItemsSliderCardContents({
    Key? key,
    required this.pokemonItems,
    required this.textTheme,
  }) : super(key: key);

  final PokemonItemsDetails pokemonItems;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 8),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'item#${pokemonItems.id}',
                    child: PokemonImageCache(
                        imageURL: pokemonItems.sprites.spritesDefault!,
                        itemSize: 40),
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                pokemonItems.name.toUpperCase(),
                //pokemonItems.id.toString(),
                maxLines: 2,
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  'Category: ${pokemonItems.category.name.toLowerCase()}',
                  style: textTheme.labelSmall,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
