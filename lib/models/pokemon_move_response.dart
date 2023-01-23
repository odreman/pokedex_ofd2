import 'dart:convert';

class PokemonMoveResponse {
  PokemonMoveResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<MoveResult> results;

  factory PokemonMoveResponse.fromJson(String str) =>
      PokemonMoveResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonMoveResponse.fromMap(Map<String, dynamic> json) =>
      PokemonMoveResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<MoveResult>.from(
            json["results"].map((x) => MoveResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class MoveResult {
  MoveResult({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory MoveResult.fromJson(String str) =>
      MoveResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MoveResult.fromMap(Map<String, dynamic> json) => MoveResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
