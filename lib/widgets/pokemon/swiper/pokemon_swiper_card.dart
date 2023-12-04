import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/generals/pokemon_image_cache.dart';

import '../../../models/pokemon_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokemon_types.dart';

class PokemonSwiperCard extends StatelessWidget {
  final PokemonDetails pokemon;
  final double sizeTextType = 14;

  const PokemonSwiperCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        color: PokemonColors.pokeColorBackground(
            pokemon.types![0].type!.name.toString()),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * .40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PokemonImageCache(
                    itemSize: size.height * .4, imageURL: pokemon.imageUrl!),
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: size.height * .150,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      //Typer
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pokemon.types!
                              .map((e) =>
                                  PokemonTypes(e.type!.name, sizeTextType))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //Name
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 8),
                          child: Text(
                            pokemon.name!.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      //Number
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '#${pokemon.idWithFormat}',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
