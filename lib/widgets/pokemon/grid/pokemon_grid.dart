import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_details.dart';
import 'package:pokedex_ofd2/widgets/pokemon/grid/pokemon_grid_card.dart';

import '../pokemon_screen_app_bar.dart';

class PokemonGrid extends StatefulWidget {
  final List<PokemonDetails> pokemons;
  final Function onNextPage;
  final int maxItems;

  const PokemonGrid({
    Key? key,
    required this.pokemons,
    required this.onNextPage,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<PokemonGrid> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonGrid> {
  final ScrollController scrollController = ScrollController();
  final StreamController<List<PokemonDetails>> streamController =
      StreamController<List<PokemonDetails>>();
  List<PokemonDetails> pokemonsListWithDetails = [];

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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const PokemonScreenAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: StreamBuilder<List<PokemonDetails>>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < snapshot.data!.length) {
                          final PokemonDetails pokemons = snapshot.data![index];
                          return PokemonGridCard(
                            pokemons: pokemons,
                            onPress: () => Navigator.pushNamed(
                              context,
                              'detailsPokemon',
                              arguments: pokemons,
                            ),
                          );
                        } else if (index == widget.maxItems) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            child: Center(
                              child: Text('No more items'),
                            ),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                      childCount: snapshot.data!.length + 1,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                } else {
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
