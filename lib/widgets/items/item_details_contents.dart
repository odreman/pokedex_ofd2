import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon_items_details.dart';
import '../berries/generations.dart';
import 'package:animate_do/animate_do.dart';

class ItemDetailsContents extends StatelessWidget {
  final PokemonItemsDetails pokemonItem;
  final double itemSize = 30;

  const ItemDetailsContents({
    Key? key,
    required this.pokemonItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                              flex: 3,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FadeIn(
                                    delay: const Duration(milliseconds: 200),
                                    child: Text(
                                      pokemonItem.name.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )),
                              )),
                          Expanded(
                              flex: 2,
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Hero(
                                    tag: 'item#${pokemonItem.id}',
                                    child: CachedNetworkImage(
                                      imageUrl: pokemonItem
                                          .sprites.spritesDefault
                                          .toString(),
                                      width: itemSize,
                                      height: itemSize,
                                      useOldImageOnUrlChange: true,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ))),
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
                          delay: const Duration(milliseconds: 250),
                          child: Text(
                            pokemonItem.effectEntries[0].shortEffect
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

          ///
//card #2
          Card(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .12,
              constraints: const BoxConstraints(minHeight: 110),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FadeIn(
                        delay: const Duration(milliseconds: 200),
                        child: const Text(
                          'Efect',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  //
                  ///
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 5,
                      top: 10,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        pokemonItem.effectEntries[0].effect
                            .toString()
                            .replaceAll('\n', ', '),
                        maxLines: 4,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 12,
                          height: 1.3,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
//
//card #3
          Card(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .12,
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
                            'Details',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      )),
                  //
                  ///
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 5,
                      top: 10,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        pokemonItem.flavorTextEntries[0].text
                            .toString()
                            .replaceAll('\n', ', '),
                        maxLines: 4,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 12,
                          height: 1.3,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),

          ///card #4
          Card(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .10,
              constraints: const BoxConstraints(minHeight: 60),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FadeIn(
                          delay: const Duration(milliseconds: 200),
                          child: const Text(
                            'Others',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            flex: 1,
                            child: Text('Cost:',
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
                              child: Text(pokemonItem.cost.toString(),
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
                ],
              ),
            ),
          ),

          ///card #5
          Card(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .09,
              constraints: const BoxConstraints(minHeight: 75),
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
                              children: pokemonItem.gameIndices
                                  .map((e) => generations(e.generation.name))
                                  .toList(),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ]));
  }
}
