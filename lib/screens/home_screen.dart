import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_details.dart';
import 'package:pokedex_ofd2/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/pokedex_provider.dart';
import '../widgets/berries/slider/berry_slider.dart';
//import '../widgets/move/slider/move_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pokedex',
            style: TextStyle(
              fontFamily: 'PokemonSolid',
              fontSize: 24,
              color: Colors.white,
              shadows: [],
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas de pokemon
              PokemonSwiper(
                pokemons: pokemonProvider.onPokemonsListWithDetailsStream.value,
                onNextPage: () => pokemonProvider.getPokemons(true),
                maxItems: pokemonProvider.maxPokemons,
              ),

              //Slider de Items
              PokemonItemsSlider(
                pokemonItems: pokemonProvider.onPokemonItems,
                title: "Items",
                onNextPage: () => pokemonProvider.getPokemonItems(true),
                maxItems: pokemonProvider.maxPokemonItemsDetails,
              ),

              //Slider de Bayas
              BerrySlider(
                pokemonBerrys: pokemonProvider.onPokemonBerrysDetails,
                title: "Berries",
                onNextPage: () => pokemonProvider.getPokemonBerry(true),
                maxItems: pokemonProvider.maxPokemonBerrysDetails,
              ),

              //Slider de Movimientos
              /*
              MoveSlider(
                pokemonMoves: pokemonProvider.onPokemonMovesDetails,
                title: "Moves",
                onNextPage: () => pokemonProvider.getPokemonMoves(true),
                maxItems: pokemonProvider.maxPokemonMovesDetails,
              ),
              */
            ],
          ),
        ));
  }
}
