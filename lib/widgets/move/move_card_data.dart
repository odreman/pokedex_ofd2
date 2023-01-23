import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/models/models.dart';

import '../../utils/colors.dart';

class MoveCardData extends StatelessWidget {
  const MoveCardData(
      {Key? key,
      required this.move,
      required this.pokemonDetails,
      this.onPress})
      : super(key: key);

  @required
  final Move move;
  @required
  final PokemonDetails pokemonDetails;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        width: MediaQuery.of(context).size.width * .55,
        decoration: BoxDecoration(
          color: PokemonColors.pokeColorBackground(
              pokemonDetails.types![0].type!.name),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            onTap: onPress,
            splashColor: Colors.white10,
            highlightColor: Colors.white10,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Movement',
                  style: TextStyle(
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    move.move!.name.toString().toUpperCase(),
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 22,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'At level ${move.versionGroupDetails![0].levelLearnedAt.toString().toUpperCase()}',
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ])));
  }
}
