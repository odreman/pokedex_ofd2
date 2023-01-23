import 'package:flutter/material.dart';
import '../../../utils/pokemon_sprites_url.dart';
import '../../generals/pokemon_image_cache.dart';

class PokemonSpritesCardData extends StatelessWidget {
  const PokemonSpritesCardData({
    Key? key,
    required this.pokemonSpritesUrl,
    required this.color,
  }) : super(key: key);

  @required
  final PokemonSpritesUrl pokemonSpritesUrl;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        width: MediaQuery.of(context).size.width * .75,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
                child: Align(
              alignment: Alignment.topLeft,
              child: PokemonImageCache(
                  itemSize: 160, imageURL: pokemonSpritesUrl.url),
            )),
          ),
          Column(children: const [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 8),
                child: Text(
                  'Sprite',
                  style: TextStyle(
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 160),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                pokemonSpritesUrl.name,
                maxLines: 3,
                style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontSize: 22,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]));
  }
}
