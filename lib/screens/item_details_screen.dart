import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_items_details.dart';

import '../widgets/items/item_details_contents.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonItemsDetails pokemonItem =
        ModalRoute.of(context)!.settings.arguments as PokemonItemsDetails;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.deepOrange,
          expandedHeight: 100,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.all(0),
            title: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.deepOrange,
              child: const Text(
                'Item',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ItemDetailsContents(pokemonItem: pokemonItem),
        ])),
      ],
    ));
  }
}
