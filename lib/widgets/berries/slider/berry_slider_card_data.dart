import 'package:flutter/material.dart';

import '../../../models/pokemon_berry_details.dart';
import '../../generals/pokemon_image_cache.dart';

class BarrySliderCardData extends StatelessWidget {
  const BarrySliderCardData({
    Key? key,
    required this.pokemonBerrys,
    required this.textTheme,
  }) : super(key: key);

  final PokemonBerryDetails pokemonBerrys;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: 'berry#${pokemonBerrys.id}',
                  child: PokemonImageCache(
                      imageURL: pokemonBerrys.sprites!, itemSize: 35),
                )),
            const SizedBox(
              width: 5,
            ),
            Text(
              '#${pokemonBerrys.id} - ${pokemonBerrys.name.toUpperCase()}',
              style: textTheme.labelSmall,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
