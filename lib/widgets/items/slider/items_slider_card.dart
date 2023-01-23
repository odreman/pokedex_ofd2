import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/items/slider/items_slider_card_contents.dart';

import '../../../models/pokemon_items_details.dart';
import '../../../utils/colors.dart';
import '../../generals/pokeball_background.dart';

class ItemSliderCard extends StatelessWidget {
  final PokemonItemsDetails pokemonItems;
  final Function()? onPress;

  const ItemSliderCard({Key? key, required this.pokemonItems, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: PokemonColors.gallery,
        width: size.width * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: onPress,
          splashColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade300,
          child: Stack(
            children: [
              pokeballBackground(height: 110),
              ItemsSliderCardContents(
                  pokemonItems: pokemonItems, textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}
