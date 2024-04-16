import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/pokemon_evolution_chain.dart';
import 'package:pokedex_ofd2/models/pokemon_species.dart';
import 'package:pokedex_ofd2/utils/colors.dart';
import 'package:provider/provider.dart';
import '../models/pokemon_details.dart';
import '../providers/pokedex_provider.dart';
import '../widgets/pokemonDetails/details_contents.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size;
    final size2 = MediaQuery.of(context).padding.top;

    final PokemonDetails pokemonDetails =
        ModalRoute.of(context)!.settings.arguments as PokemonDetails;

    final colorsPokemon =
        PokemonColors.pokeColorBackground(pokemonDetails.types![0].type!.name);

    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: false);

    return FutureBuilder(
        future: pokemonProvider.getSpeciesbyUrl(
            pokemonDetails.id!, pokemonDetails.species!.url),
        builder: (_, AsyncSnapshot<PokemonSpecies> snapshot) {
          if (!snapshot.hasData) {
            /*
            return Container(
                width: double.infinity,
                color: Colors.white,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: shimmerDetails()));
           */
            return Container(
                width: double.infinity,
                color: colorsPokemon,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      strokeWidth: 10,
                    ),
                  ],
                ));
          }

          final PokemonSpecies pokemonSpecies = snapshot.data!;

          final PokemonEvolutionChain? pokemonEvolutionChain =
              pokemonProvider.getEvolutionbyIdPokemon(pokemonSpecies.id!);

          return Scaffold(
              body: Stack(
            children: <Widget>[
              DetailsContents(
                size1: size1,
                size2: size2,
                colors: colorsPokemon,
                pokemonDetails: pokemonDetails,
                pokemonSpecies: pokemonSpecies,
                pokemonEvolutionChain: pokemonEvolutionChain,
              ),
            ],
          ));
        });
  }
}
