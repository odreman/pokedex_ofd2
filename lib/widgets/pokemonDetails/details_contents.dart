import 'package:flutter/material.dart';
import '../../models/pokemon_details.dart';
import '../../models/pokemon_evolution_chain.dart';
import '../../models/pokemon_species.dart';
import '../../utils/colors.dart';
import '../../utils/pokemon_sprites_url.dart';
import 'about_slider.dart';
import '../generals/poke_clip_path.dart';
import '../move/move_card_data.dart';
import 'cards/pokemon_sprites_card_data.dart';
import 'box_decoration.dart';
import 'cards/card_breeding.dart';
import 'cards/card_evolution.dart';
import 'cards/card_general_info.dart';
import 'cards/card_stats.dart';
import 'details_header.dart';
import 'pokeball_decoration.dart';

class DetailsContents extends StatelessWidget {
  @required
  final Size size1;
  @required
  final double size2;
  @required
  final Color colors;
  @required
  final PokemonDetails pokemonDetails;
  @required
  final PokemonSpecies pokemonSpecies;
  @required
  final PokemonEvolutionChain? pokemonEvolutionChain;

  const DetailsContents({
    super.key,
    required this.size1,
    required this.size2,
    required this.colors,
    required this.pokemonDetails,
    required this.pokemonSpecies,
    required this.pokemonEvolutionChain,
  });

  @override
  Widget build(BuildContext context) {
    var sliverCustomHeaderDelegate = _SliverCustomHeaderDelegate(
      minheight: 0,
      maxheight: 330,
      child: Material(
        color: Colors.white,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          //_buildBackground(colors),
          PokeClipPath(colors: colors),
          buildBoxDecoration(),
          PokeballDecoration(
              screenSize: size1, safeAreaTop: size2, color: colors),
          DetailsHeader(pokemonDetails: pokemonDetails),
        ]),
      ),
    );

    var listMoves = pokemonDetails.moves!.toSet().toList();

    var listFlavor = pokemonSpecies.flavorTextEntries!
        .where((x) => x.language!.name == 'en')
        .toSet()
        .toList();
    listFlavor = listFlavor.toSet().toList();

    String desc = '';
    StringBuffer description = StringBuffer();

    var it =
        listFlavor[listFlavor.length - 1].flavorText!.replaceAll("\n", " ");
    if (!desc.toString().toLowerCase().contains(it.toLowerCase())) {
      description.write('$it ');
      desc += '$it ';
    }

    final List<PokemonSpritesUrl> pokemonSpritesUrl = [];

    if (pokemonDetails.sprites != null) {
      if (pokemonDetails.sprites!.other != null) {
        if (pokemonDetails.sprites!.other!.officialArtwork != null) {
          if (pokemonDetails.sprites!.other!.officialArtwork!.frontDefault !=
              null) {
            pokemonSpritesUrl.add(PokemonSpritesUrl('Default',
                pokemonDetails.sprites!.other!.officialArtwork!.frontDefault!));
          }
        }
      }

      if (pokemonDetails.sprites!.frontFemale != null) {
        pokemonSpritesUrl.add(
            PokemonSpritesUrl('Female', pokemonDetails.sprites!.frontFemale!));
      }
      if (pokemonDetails.sprites!.backFemale != null) {
        pokemonSpritesUrl.add(
            PokemonSpritesUrl('Female', pokemonDetails.sprites!.backFemale!));
      }
      if (pokemonDetails.sprites!.frontShiny != null) {
        pokemonSpritesUrl.add(
            PokemonSpritesUrl('Shiny', pokemonDetails.sprites!.frontShiny!));
      }
      if (pokemonDetails.sprites!.backShiny != null) {
        pokemonSpritesUrl.add(
            PokemonSpritesUrl('Shiny', pokemonDetails.sprites!.backShiny!));
      }
      if (pokemonDetails.sprites!.frontShinyFemale != null) {
        pokemonSpritesUrl.add(PokemonSpritesUrl(
            'Shiny Female', pokemonDetails.sprites!.frontShinyFemale!));
      }
      if (pokemonDetails.sprites!.backShinyFemale != null) {
        pokemonSpritesUrl.add(PokemonSpritesUrl(
            'Shiny Female', pokemonDetails.sprites!.backShinyFemale!));
      }
    }

    final size = MediaQuery.of(context).size;

    return CustomScrollView(slivers: <Widget>[
      SliverPersistentHeader(
          pinned: true, delegate: sliverCustomHeaderDelegate),

      //body

      //About Cards
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: size.height * 0.20,
          constraints: const BoxConstraints(minHeight: 160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listFlavor.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: AboutCardData(
                          listAbout: listFlavor[index],
                          pokemonDetails: pokemonDetails),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //General info Card
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.3,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              child: CardGeneralInfo(pokemonDetails, pokemonSpecies),
            );
          },
          childCount: 1,
        ),
      ),

      //Base stats Card
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.4,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              child: CardStats(pokemonDetails),
            );
          },
          childCount: 1,
        ),
      ),

      //Breeding Card
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.6,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              child: CardBreeding(pokemonDetails, pokemonSpecies),
            );
          },
          childCount: 1,
        ),
      ),

      //Evolution
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.9,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              child: CardEvolution(pokemonDetails, pokemonEvolutionChain),
            );
          },
          childCount: 1,
        ),
      ),

      //Sprites Cards
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: pokemonSpritesUrl.length > 1 ? (size.height * 0.20) : 0,
          constraints: pokemonSpritesUrl.length > 1
              ? const BoxConstraints(minHeight: 190)
              : const BoxConstraints(minHeight: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokemonSpritesUrl.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 0,
                        child: PokemonSpritesCardData(
                          pokemonSpritesUrl: pokemonSpritesUrl[index],
                          color: PokemonColors.getpokeColor(
                              pokemonDetails.types![0].type!.name),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //Movement Cards
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: size.height * 0.14,
          constraints: const BoxConstraints(minHeight: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listMoves.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 0,
                        child: MoveCardData(
                          move: listMoves[index],
                          pokemonDetails: pokemonDetails,
                          onPress: () => Navigator.pushNamed(
                              context, 'MoveDetails',
                              arguments: listMoves[index]),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // fin body
    ]);
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}
