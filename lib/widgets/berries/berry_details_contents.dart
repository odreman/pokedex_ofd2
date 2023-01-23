import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/widgets/generals/pokemon_image_cache.dart';
import 'package:provider/provider.dart';

import '../../models/pokemon_berry_details.dart';
import '../../models/pokemon_items_details.dart';
import '../../providers/pokedex_provider.dart';
import '../generals/shimmer.dart';
import 'berry_flavor_type.dart';
import 'generations.dart';
import 'package:animate_do/animate_do.dart';

class BerryDetailsContents extends StatelessWidget {
  final PokemonBerryDetails pokemonBerry;
  final double itemSize = 30;

  const BerryDetailsContents({
    Key? key,
    required this.pokemonBerry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: false);

    return FutureBuilder(
      future: pokemonProvider.getItembyUrl2(
          pokemonBerry.idItem, pokemonBerry.item.url),
      builder: (_, AsyncSnapshot<PokemonItemsDetails> snapshot) {
        if (!snapshot.hasData) {
          return shimmerBerryItem();
        }

        final itemDetails = snapshot.data!;

        return Container(
            margin: const EdgeInsets.only(top: 25, left: 5, right: 5),
            child: Column(children: [
              //Card#1
              Card(
                  child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .12,
                      constraints: const BoxConstraints(minHeight: 100),
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: FadeIn(
                                        child: Text(
                                          pokemonBerry.name.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      ))),
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Hero(
                                      tag: 'berry#${pokemonBerry.id}',
                                      child: PokemonImageCache(
                                          imageURL: pokemonBerry.sprites!,
                                          itemSize: itemSize),
                                    ),
                                  )),
                            ])),

                        ///
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 5,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FadeIn(
                              delay: const Duration(milliseconds: 100),
                              child: Text(
                                itemDetails.effectEntries[0].shortEffect
                                    .toString()
                                    .replaceAll('\n', ', '),
                                maxLines: 2,
                                style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 15,
                                  height: 1.3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ]))),

              ///card #2
              Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .10,
                  constraints: const BoxConstraints(minHeight: 90),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FadeIn(
                              delay: const Duration(milliseconds: 200),
                              child: const Text(
                                'Fling',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Power:',
                                    style: TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontSize: 13,
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ))),
                            Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('${itemDetails.flingPower}',
                                      style: const TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 13,
                                        height: 1.3,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      )),
                                )),
                          ],
                        ),
                      ),
//
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Efect:',
                                    style: TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontSize: 13,
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ))),
                            Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      itemDetails.getflingEffect == ""
                                          ? '--'
                                          : itemDetails.getflingEffect,
                                      style: const TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 13,
                                        height: 1.3,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      )),
                                )),
                          ],
                        ),
                      ),
//
                    ],
                  ),
                ),
              ),

              ///
              ///card #3
              Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .10,
                  constraints: const BoxConstraints(minHeight: 90),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FadeIn(
                              delay: const Duration(milliseconds: 200),
                              child: const Text(
                                'Flavors',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.topLeft,
                        width: size.width * 0.99,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: pokemonBerry.flavors
                                    .map((e) =>
                                        flavorType(e.flavor.name, e.potency))
                                    .toList(),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              //

              ///
              ///card #4
              Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .10,
                  constraints: const BoxConstraints(minHeight: 90),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FadeIn(
                              delay: const Duration(milliseconds: 200),
                              child: const Text(
                                'Natural gift',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.topLeft,
                        width: size.width * 0.99,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: flavorType(
                                    pokemonBerry.naturalGiftType.name,
                                    pokemonBerry.naturalGiftPower))),
                      ),
                    ],
                  ),
                ),
              ),

              ///
              ///card #5
              Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .09,
                  constraints: const BoxConstraints(minHeight: 70),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FadeIn(
                              delay: const Duration(milliseconds: 200),
                              child: const Text(
                                'Generations',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          alignment: Alignment.topLeft,
                          width: size.width * 0.99,
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: snapshot.data!.gameIndices
                                      .map(
                                          (e) => generations(e.generation.name))
                                      .toList(),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),

              ///
            ]));
      },
    );
  }
}
