import 'dart:convert';

class PokemonBerrysResponse {
  PokemonBerrysResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String? next;
  dynamic? previous;
  List<PokemonBerrys> results;

  factory PokemonBerrysResponse.fromJson(String str) =>
      PokemonBerrysResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonBerrysResponse.fromMap(Map<String, dynamic> json) =>
      PokemonBerrysResponse(
        count: json["count"],
        next: json["next"] ?? null,
        previous: json["previous"],
        results: List<PokemonBerrys>.from(
            json["results"].map((x) => PokemonBerrys.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next ?? null,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class PokemonBerrys {
  PokemonBerrys({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonBerrys.fromJson(String str) =>
      PokemonBerrys.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonBerrys.fromMap(Map<String, dynamic> json) => PokemonBerrys(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
