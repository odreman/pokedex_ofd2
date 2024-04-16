import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pokedex_provider.dart';
import '../widgets/pokemon/grid/pokemon_grid.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({super.key});

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: true);

    return PokemonGrid(
      pokemons: pokemonProvider.onPokemonsListWithDetailsStream.value,
      onNextPage: () => pokemonProvider.getPokemons(true),
      maxItems: pokemonProvider.maxPokemons,
    );
  }
}
