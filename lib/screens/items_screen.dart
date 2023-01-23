import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pokedex_provider.dart';
import '../widgets/items/grid/item_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: true);

    return ItemGrid(
      pokemonItems: pokemonProvider.onPokemonItems,
      onNextPage: () => pokemonProvider.getPokemonItems(true),
      maxItems: pokemonProvider.maxPokemonItemsDetails,
    );
  }
}
