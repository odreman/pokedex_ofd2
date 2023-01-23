import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pokedex_provider.dart';
import '../widgets/berries/grid/berry_grid.dart';

class BerryScreen extends StatefulWidget {
  const BerryScreen({super.key});

  @override
  State<BerryScreen> createState() => _BerryScreenState();
}

class _BerryScreenState extends State<BerryScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: true);

    return BerryGrid(
      pokemonBerrys: pokemonProvider.onPokemonBerrysDetails,
      onNextPage: () => pokemonProvider.getPokemonBerry(true),
      maxItems: pokemonProvider.maxPokemonBerrysDetails,
    );
  }
}
