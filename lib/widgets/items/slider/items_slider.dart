import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/providers/pokedex_provider.dart';
import '../../../models/pokemon_items_details.dart';
import 'items_slider_card.dart';

class PokemonItemsSlider extends StatefulWidget {
  final List<PokemonItemsDetails> pokemonItems;
  final String? title;
  final Function onNextPage;
  final int maxItems;

  const PokemonItemsSlider({
    Key? key,
    required this.pokemonItems,
    required this.onNextPage,
    this.title,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<PokemonItemsSlider> createState() => _PokemonItemsSliderState();
}

class _PokemonItemsSliderState extends State<PokemonItemsSlider> {
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
    final size = MediaQuery.of(context).size;

    if (widget.pokemonItems.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.3,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      width: double.infinity,
      height: size.height * 0.2,
      constraints: const BoxConstraints(minHeight: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'itemList',
                  arguments: PokemonsProvider),
              child: (Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${widget.title!} >',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
            ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.pokemonItems.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < widget.pokemonItems.length) {
                  final PokemonItemsDetails pokemonItems =
                      widget.pokemonItems[index];
                  return ItemSliderCard(
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
      ),
    );
  }
}
