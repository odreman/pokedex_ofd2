import 'package:flutter/material.dart';

import '../../../models/pokemon_details.dart';
import '../../../models/pokemon_species.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';

class CardBreeding extends StatelessWidget {
  @required
  final PokemonDetails pokemon;
  @required
  final PokemonSpecies pokemonSpecies;
  const CardBreeding(this.pokemon, this.pokemonSpecies, {super.key});

  @override
  Widget build(BuildContext context) {
    String eggGroupslist = '';
    if (pokemonSpecies.eggGroups != null &&
        pokemonSpecies.eggGroups!.isNotEmpty) {
      for (var egg in pokemonSpecies.eggGroups!) {
        if (eggGroupslist == '') {
          eggGroupslist = egg.name!;
        } else {
          eggGroupslist = '$eggGroupslist, ${egg.name!}';
        }
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Text(
            'Breeding',
            style: TextStyle(
                color: PokemonColors.pokeColorBackground(
                    pokemon.types![0].type!.name),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              const Expanded(
                  flex: 1,
                  child: Text('Egg Groups:',
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                        fontSize: 13,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ))),
              _labelEggGroups(eggGroupslist),
            ],
          ),
        ),

        //todo obtener el sexo del pokemon
        /*
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Text('Gender:',
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                        fontSize: 13,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ))),
              _labelGender('85.5%', '14.5%'),
            ],
          ),
        ),
        */
      ]),
    );
  }
}

Widget _labelGender(String male, female) {
  return Expanded(
      flex: 3,
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(children: [
            const Image(
              image: AppGeneralImages.male,
              width: 12,
              height: 12,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(male,
                style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontSize: 13,
                  height: 1.3,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 10,
            ),
            const Image(
              image: AppGeneralImages.female,
              width: 12,
              height: 12,
              color: Colors.pink,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(female,
                style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontSize: 13,
                  height: 1.3,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                )),
          ])));
}

Widget _labelEggGroups(String name) {
  return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(name,
            style: const TextStyle(
              overflow: TextOverflow.fade,
              fontSize: 13,
              height: 1.3,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            )),
      ));
}
