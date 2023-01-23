import 'package:flutter/material.dart';
import '../../../models/pokemon_berry_details.dart';
import '../../../providers/pokedex_provider.dart';
import 'berry_slider_card.dart';

class BerrySlider extends StatefulWidget {
  final List<PokemonBerryDetails> pokemonBerrys;
  final String? title;
  final Function onNextPage;
  final int maxItems;

  const BerrySlider({
    Key? key,
    required this.pokemonBerrys,
    required this.onNextPage,
    this.title,
    required this.maxItems,
  }) : super(key: key);

  @override
  State<BerrySlider> createState() => _BerrySliderState();
}

class _BerrySliderState extends State<BerrySlider> {
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

    if (widget.pokemonBerrys.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.1,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      width: double.infinity,
      height: size.height * 0.12,
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'berryList',
                  arguments: PokemonsProvider),
              child: (Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${widget.title!} >',
                    textAlign: TextAlign.center,
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
              itemCount: widget.pokemonBerrys.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < widget.pokemonBerrys.length) {
                  final PokemonBerryDetails pokemonBerryDetails =
                      widget.pokemonBerrys[index];
                  return BarrySliderCard(
                      pokemonBerrys: pokemonBerryDetails,
                      onPress: () => Navigator.pushNamed(
                          context, 'berryDetails',
                          arguments: widget.pokemonBerrys[index]));
                } else if (index == widget.maxItems) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Center(
                      child: Text('No more items'),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
