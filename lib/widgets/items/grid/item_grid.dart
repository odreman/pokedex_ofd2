import 'package:flutter/material.dart';
import '../../../models/pokemon_items_details.dart';
import '../item_screen_app_bar.dart';
import 'item_grid_card.dart';

class ItemGrid extends StatefulWidget {
  final List<PokemonItemsDetails> pokemonItems;
  final Function onNextPage;
  final int maxItems;

  const ItemGrid({
    Key? key,
    required this.pokemonItems,
    required this.onNextPage,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
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
        const ItemScreenAppBar(),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1),
          delegate: SliverChildBuilderDelegate(
            childCount: widget.pokemonItems.length + 1,
            (context, index) {
              if (index < widget.pokemonItems.length) {
                final PokemonItemsDetails pokemonItems =
                    widget.pokemonItems[index];
                return ItemGridCard(
                  pokemonItems: pokemonItems,
                  onPress: () => Navigator.pushNamed(context, 'itemDetails',
                      arguments: widget.pokemonItems[index]),
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
