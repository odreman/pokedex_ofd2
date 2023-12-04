import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/generals/shimmer.dart';
import 'package:pokedex_ofd2/widgets/pokemon/swiper/pokemon_swiper_card.dart';

import '../../../models/pokemon_details.dart';

class PokemonSwiper extends StatefulWidget {
  final List<PokemonDetails> pokemons;
  final Function onNextPage;
  final int maxItems;

  const PokemonSwiper({
    Key? key,
    required this.pokemons,
    required this.onNextPage,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<PokemonSwiper> createState() => _PokemonSwiperState();
}

class _PokemonSwiperState extends State<PokemonSwiper> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (widget.pokemons.isEmpty) {
      return Container(
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          height: size.height * 0.6,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                  color: Colors.grey.shade200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            itemCount: widget.pokemons.length + 1,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.93,
            itemHeight: size.height * 0.55,
            itemBuilder: (_, int index) {
              if (index < widget.pokemons.length) {
                final PokemonDetails pokemon = widget.pokemons[index];

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detailsPokemon',
                      arguments: pokemon),
                  child: PokemonSwiperCard(pokemon: pokemon),
                );
              } else if (widget.pokemons.length == widget.maxItems) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Center(
                    child: Text('No more items'),
                  ),
                );
              } else {
                widget.onNextPage();
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
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
