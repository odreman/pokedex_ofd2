import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_berry_details.dart';

import '../widgets/berries/berry_details_contents.dart';

class BerryDetailsScreen extends StatelessWidget {
  const BerryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonBerryDetails pokemonBerry =
        ModalRoute.of(context)!.settings.arguments as PokemonBerryDetails;

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
                'Berry',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          BerryDetailsContents(pokemonBerry: pokemonBerry),
        ])),
      ],
    ));
  }
}
