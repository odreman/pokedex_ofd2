import 'dart:convert';

class PokemonItemsResponse {
  PokemonItemsResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String? next;
  dynamic previous;
  List<PokemonItems> results;

  factory PokemonItemsResponse.fromJson(String str) =>
      PokemonItemsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonItemsResponse.fromMap(Map<String, dynamic> json) =>
      PokemonItemsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonItems>.from(
            json["results"].map((x) => PokemonItems.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class PokemonItems {
  PokemonItems({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonItems.fromJson(String str) =>
      PokemonItems.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonItems.fromMap(Map<String, dynamic> json) => PokemonItems(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
