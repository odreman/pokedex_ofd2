import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/generals/shimmer.dart';
import 'package:pokedex_ofd2/widgets/pokemon/swiper/pokemon_swiper_card.dart';

import '../../../models/pokemon_details.dart';

class PokemonSwiper extends StatelessWidget {
  final List<PokemonDetails> pokemons;

  const PokemonSwiper({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (pokemons.isEmpty) {
      return
          /*
          Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 10,
              ),
            ],
          ));
          */
          Container(
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              height: size.height * 0.6,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          height: (size.height * 0.6) * .7,
                          width: (size.width * 0.6) * .7,
                          child: shimmerPokemonSwiper()))));
    }

    return Container(
        margin: const EdgeInsets.only(top: 15),
        width: double.infinity,
        height: size.height * 0.6,
        child: Column(children: [
          Swiper(
            itemCount: pokemons.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.93,
            itemHeight: size.height * 0.55,
            itemBuilder: (_, int index) {
              final PokemonDetails pokemon = pokemons[index];

              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detailsPokemon',
                    arguments: pokemon),
                child: PokemonSwiperCard(pokemon: pokemon),
              );
            },
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'pokemonList'),
            child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 40),
                  child: Text(
                    'view all pokemons >',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ]));
  }
}
