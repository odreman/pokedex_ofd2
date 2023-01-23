import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_species.dart';
import 'package:pokedex_ofd2/utils/colors.dart';

import '../../models/pokemon_details.dart';

class AboutSlider extends StatefulWidget {
  @required
  final PokemonSpecies pokemonSpecies;
  @required
  final PokemonDetails pokemonDetails;

  const AboutSlider(
      {Key? key, required this.pokemonSpecies, required this.pokemonDetails})
      : super(key: key);

  @override
  State<AboutSlider> createState() => _AboutSliderState();
}

class _AboutSliderState extends State<AboutSlider> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();

    var list = widget.pokemonSpecies.flavorTextEntries!
        .where((x) => x.language!.name == 'en')
        .toSet()
        .toList();
    list = list.toSet().toList();

    String desc = '';
    StringBuffer description = StringBuffer();

    var it = list[list.length - 1].flavorText!.replaceAll("\n", " ");
    if (!desc.toString().toLowerCase().contains(it.toLowerCase())) {
      description.write('$it ');
      desc += '$it ';
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      width: double.infinity,
      height: size.height * 0.13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index < list.length) {
                    final about = list[index];
                    return _AboutCardSlider(
                        pokemonDetails: widget.pokemonDetails,
                        listAbout: about);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

class _AboutCardSlider extends StatelessWidget {
  @required
  final PokemonDetails pokemonDetails;
  @required
  final FlavorTextEntry listAbout;

  const _AboutCardSlider({
    Key? key,
    required this.pokemonDetails,
    required this.listAbout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            AboutCardData(listAbout: listAbout, pokemonDetails: pokemonDetails),
          ],
        ),
      ),
    );
  }
}

class AboutCardData extends StatelessWidget {
  const AboutCardData({
    Key? key,
    required this.pokemonDetails,
    required this.listAbout,
  }) : super(key: key);

  @required
  final PokemonDetails pokemonDetails;
  @required
  final FlavorTextEntry listAbout;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(children: [
              titleCard(),
              descriptionCard(),
            ]),
            versionDescriptionCard(),
          ],
        ));
  }

  Widget titleCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        'About',
        style: TextStyle(
            color: PokemonColors.pokeColorBackground(
                pokemonDetails.types![0].type!.name),
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
    );
  }

  Widget versionDescriptionCard() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 20),
        child: Text(
          'Version: Pokemon ${listAbout.version!.name.toString().toUpperCase()}',
          style: TextStyle(
              color: PokemonColors.pokeColorBackground(
                  pokemonDetails.types![0].type!.name),
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }

  Widget descriptionCard() {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: Text(
              listAbout.flavorText.toString().replaceAll('\n', ' '),
              maxLines: 3,
              style: const TextStyle(
                overflow: TextOverflow.fade,
                fontSize: 13,
                height: 1.3,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }
}
