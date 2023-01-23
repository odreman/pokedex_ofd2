import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/generals/pokemon_types.dart';

import '../../models/pokemon_details.dart';
import '../../utils/images.dart';
import '../generals/pokemon_image_cache.dart';

class DetailsHeader extends StatelessWidget {
  final PokemonDetails pokemonDetails;

  const DetailsHeader({super.key, required this.pokemonDetails});

  @override
  Widget build(BuildContext context) {
    const dottedImage = Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.only(
              left: 80,
            ),
            child: Image(
              image: AppGeneralImages.dotted,
              width: 30,
              height: 20,
              color: Colors.white10,
            )));

    var idPokemon = Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 40),
          child: FadeIn(
            delay: const Duration(milliseconds: 200),
            child: Text(
              '#${pokemonDetails.idWithFormat}',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                height: 1.3,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));

    var typePokemon = Align(
      alignment: Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.only(left: 13, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pokemonDetails.types!
                .map((e) => PokemonTypes(e.type!.name, 10))
                .toList(),
          )),
    );

    var namePokemon = Expanded(
      child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 100),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              child: BounceInRight(
                child: Text(
                  pokemonDetails.name!.toUpperCase(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 28,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )),
    );

    var imagePokemon = Container(
      height: 330,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
          child: Align(
        alignment: Alignment.bottomRight,
        child: Hero(
            tag: 'pokemon#${pokemonDetails.id}',
            child: PokemonImageCache(
                itemSize: 220, imageURL: pokemonDetails.imageUrl)),
      )),
    );

    var appBar = Padding(
      padding: const EdgeInsets.all(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        elevation: 0,
      ),
    );

    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          appBar,
          imagePokemon,
          Column(children: <Widget>[
            namePokemon,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    typePokemon,
                    dottedImage,
                    idPokemon,
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
