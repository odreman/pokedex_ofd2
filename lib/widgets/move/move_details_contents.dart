import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pokemon_details.dart';
import '../../models/pokemon_move_details.dart';
import '../../providers/pokedex_provider.dart';
import '../generals/shimmer.dart';

class MoveDetailsContents extends StatelessWidget {
  final Move move;

  const MoveDetailsContents({
    Key? key,
    required this.move,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonsProvider>(context, listen: false);

    return FutureBuilder(
      future: pokemonProvider.getMovebyUrl(
          move.move!.name.toString(), move.move!.url),
      builder: (_, AsyncSnapshot<PokemonMoveDetails> snapshot) {
        if (!snapshot.hasData) {
          return shimmerMove();
        }
        final moveResponse = snapshot.data!;

        var flavorTextEntries = moveResponse.flavorTextEntries!
            .where((x) => x.language!.name == 'en')
            .toSet()
            .toList();
        flavorTextEntries = flavorTextEntries.toSet().toList();

        return Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(children: [
            Card(
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          move.move!.name.toUpperCase().toString(),
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                flavorTextEntries[0]
                                    .flavorText!
                                    .toString()
                                    .replaceAll('\n', ' '),
                                maxLines: 3,
                                style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 14,
                                  height: 1.3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ]))),
            Card(
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Type:',
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
                                  child:
                                      Text(moveResponse.type!.name.toString(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Category:',
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
                                      moveResponse.meta!.category!.name
                                          .toString()
                                          .replaceAll('+', ', '),
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
                      const SizedBox(
                        height: 30,
                      ),
                    ]))),
/////
            Card(
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                                  child: Text(
                                      moveResponse.power == null
                                          ? '--'
                                          : moveResponse.power.toString(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Precision:',
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
                                      moveResponse.accuracy == null
                                          ? '--'
                                          : '${moveResponse.accuracy}%',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('Priority:',
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
                                      moveResponse.priority == null
                                          ? '--'
                                          : moveResponse.priority.toString(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                                flex: 1,
                                child: Text('PP:',
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
                                      moveResponse.pp == null
                                          ? '--'
                                          : moveResponse.pp.toString(),
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

                      ////
                      const SizedBox(
                        height: 30,
                      ),
                    ])))
          ]),
        );
      },
    );
  }
}
