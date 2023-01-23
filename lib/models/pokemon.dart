import 'dart:convert';
import 'dart:core';

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  get id {
    final data = url.split('/');
    data.removeLast();
    String id = data.last == "" ? "0" : data.last;
    return _transformPokemonId(id);
  }

  get imageUrl {
    if (id != "") {
      return 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$id.png';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };

  String _transformPokemonId(String pokemonId) {
    int id = int.parse(pokemonId);
    return id < 10
        ? '00$id'
        : id < 100
            ? '0$id'
            : id.toString();
  }
}
