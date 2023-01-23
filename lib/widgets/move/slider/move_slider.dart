import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/providers/pokedex_provider.dart';

import '../../../models/pokemon_move_details.dart';
import 'move_slider_card.dart';

class MoveSlider extends StatefulWidget {
  final List<PokemonMoveDetails> pokemonMoves;
  final String? title;
  final Function onNextPage;
  final int maxItems;

  const MoveSlider({
    Key? key,
    required this.pokemonMoves,
    required this.onNextPage,
    this.title,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<MoveSlider> createState() => _PokemonMoveSliderState();
}

class _PokemonMoveSliderState extends State<MoveSlider> {
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

    if (widget.pokemonMoves.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.3,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      width: double.infinity,
      height: size.height * 0.18,
      constraints: const BoxConstraints(minHeight: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'moveList',
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
              itemCount: widget.pokemonMoves.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < widget.pokemonMoves.length) {
                  final PokemonMoveDetails pokemonMoves =
                      widget.pokemonMoves[index];
                  return MoveSliderCard(
                    pokemonMoves: pokemonMoves,
                    onPress: () => Navigator.pushNamed(context, 'MoveDetails',
                        arguments: pokemonMoves),
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
