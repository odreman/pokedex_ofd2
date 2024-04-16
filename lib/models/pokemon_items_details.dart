import 'dart:convert';

class PokemonItemsDetails {
  PokemonItemsDetails({
    required this.attributes,
    required this.babyTriggerFor,
    required this.category,
    required this.cost,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.flingEffect,
    required this.flingPower,
    required this.gameIndices,
    required this.heldByPokemon,
    required this.id,
    required this.machines,
    required this.name,
    required this.names,
    required this.sprites,
  });

  List<Category> attributes;
  dynamic babyTriggerFor;
  Category category;
  int cost;
  List<EffectEntry> effectEntries;
  List<FlavorTextEntry> flavorTextEntries;
  Category? flingEffect;
  dynamic flingPower;
  List<GameIndex> gameIndices;
  List<dynamic> heldByPokemon;
  int id;
  List<dynamic> machines;
  String name;
  List<Name> names;
  Sprites sprites;

  get getflingEffect {
    if (flingEffect != null) {
      return flingEffect!.name;
    } else {
      return '';
    }
  }

  factory PokemonItemsDetails.fromJson(String str) =>
      PokemonItemsDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonItemsDetails.fromMap(Map<String, dynamic> json) =>
      PokemonItemsDetails(
        attributes: List<Category>.from(
            json["attributes"].map((x) => Category.fromMap(x))),
        babyTriggerFor: json["baby_trigger_for"],
        category: Category.fromMap(json["category"]),
        cost: json["cost"],
        effectEntries: List<EffectEntry>.from(
            json["effect_entries"].map((x) => EffectEntry.fromMap(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        flingEffect: json["fling_effect"] == null
            ? null
            : Category.fromMap(json["fling_effect"]),
        flingPower: json["fling_power"],
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromMap(x))),
        heldByPokemon:
            List<dynamic>.from(json["held_by_pokemon"].map((x) => x)),
        id: json["id"],
        machines: List<dynamic>.from(json["machines"].map((x) => x)),
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        sprites: Sprites.fromMap(json["sprites"]),
      );

  Map<String, dynamic> toMap() => {
        "attributes": List<dynamic>.from(attributes.map((x) => x.toMap())),
        "baby_trigger_for": babyTriggerFor,
        "category": category.toMap(),
        "cost": cost,
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toMap())),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toMap())),
        "fling_effect": flingEffect?.toMap(),
        "fling_power": flingPower,
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
        "held_by_pokemon": List<dynamic>.from(heldByPokemon.map((x) => x)),
        "id": id,
        "machines": List<dynamic>.from(machines.map((x) => x)),
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "sprites": sprites.toMap(),
      };
}

class Category {
  Category({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class EffectEntry {
  EffectEntry({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  String effect;
  Category language;
  String shortEffect;

  factory EffectEntry.fromJson(String str) =>
      EffectEntry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EffectEntry.fromMap(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        language: Category.fromMap(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toMap() => {
        "effect": effect,
        "language": language.toMap(),
        "short_effect": shortEffect,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.language,
    required this.text,
    required this.versionGroup,
  });

  Category language;
  String text;
  Category versionGroup;

  factory FlavorTextEntry.fromJson(String str) =>
      FlavorTextEntry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        language: Category.fromMap(json["language"]),
        text: json["text"],
        versionGroup: Category.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "text": text,
        "version_group": versionGroup.toMap(),
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  int gameIndex;
  Category generation;

  factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Category.fromMap(json["generation"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "generation": generation.toMap(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  Category language;
  String name;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Category.fromMap(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
      };
}

class Sprites {
  Sprites({
    required this.spritesDefault,
  });

  String? spritesDefault;

  factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        spritesDefault: json["default"],
      );

  Map<String, dynamic> toMap() => {
        "default": spritesDefault,
      };
}
