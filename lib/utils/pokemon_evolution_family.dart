import 'package:flutter/material.dart';

class EvolutionFamily {
  @required
  String name;
  @required
  String id;
  @required
  String level;
  @required
  String urlSprite;
  @required
  int order;

  EvolutionFamily(this.name, this.id, this.level, this.urlSprite, this.order);

  List<EvolutionFamily> get getPokemonEvolutionList {
    List<EvolutionFamily> pokemonEvolutionList = [];

    return pokemonEvolutionList;
  }

  static EvolutionFamily prepareData(
      String name, String url, String level, int order) {
    final data =
        url.split('pokemon-species')[1].replaceAll(RegExp(r'[^0-9]'), '');
    String id = data;

    int idInt = id == '' ? 0 : int.parse(id);

    id = idInt < 10
        ? '00$id'
        : idInt < 100
            ? '0$id'
            : id.toString();

    String urlSprite;
    if (id != "") {
      urlSprite =
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$id.png';
    } else {
      id = "0";
      urlSprite = 'https://i.stack.imgur.com/GNhxO.png';
    }

    return EvolutionFamily(name, id, level, urlSprite, order);
  }
}
