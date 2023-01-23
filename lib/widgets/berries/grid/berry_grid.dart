import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_berry_details.dart';
import '../berry_screen_app_bar.dart';
import 'berry_grid_card.dart';

class BerryGrid extends StatefulWidget {
  final List<PokemonBerryDetails> pokemonBerrys;
  final Function onNextPage;
  final int maxItems;

  const BerryGrid({
    Key? key,
    required this.pokemonBerrys,
    required this.onNextPage,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<BerryGrid> createState() => _BerryGridState();
}

class _BerryGridState extends State<BerryGrid> {
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
        const BerryScreenAppBar(),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          delegate: SliverChildBuilderDelegate(
            childCount: widget.pokemonBerrys.length + 1,
            (context, index) {
              if (index < widget.pokemonBerrys.length) {
                final PokemonBerryDetails pokemonBerrys =
                    widget.pokemonBerrys[index];
                return BerryGridCard(
                  pokemonBerry: pokemonBerrys,
                  onPress: () => Navigator.pushNamed(context, 'berryDetails',
                      arguments: widget.pokemonBerrys[index]),
                );
              } else if (index == widget.maxItems) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Center(
                    child: Text('No more items'),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    ));
  }
}
