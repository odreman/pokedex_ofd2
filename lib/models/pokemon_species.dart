import 'dart:convert';

class PokemonSpecies {
  PokemonSpecies({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  int? baseHappiness;
  int? captureRate;
  ColorSpecie? color;
  List<ColorSpecie>? eggGroups;
  EvolutionChain? evolutionChain;
  dynamic evolvesFromSpecies;
  List<FlavorTextEntry>? flavorTextEntries;
  List<dynamic>? formDescriptions;
  bool? formsSwitchable;
  int? genderRate;
  List<Genus>? genera;
  ColorSpecie? generation;
  ColorSpecie? growthRate;
  ColorSpecie? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  List<Name>? names;
  int? order;
  List<PalParkEncounter>? palParkEncounters;
  List<PokedexNumber>? pokedexNumbers;
  ColorSpecie? shape;
  List<Variety>? varieties;

  factory PokemonSpecies.fromJson(String str) =>
      PokemonSpecies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonSpecies.fromMap(Map<String, dynamic> json) => PokemonSpecies(
        baseHappiness:
            json["base_happiness"],
        captureRate:
            json["capture_rate"],
        color:
            json["color"] == null ? null : ColorSpecie.fromMap(json["color"]!),
        eggGroups: json["egg_groups"] == null
            ? null
            : List<ColorSpecie>.from(
                json["egg_groups"].map((x) => ColorSpecie.fromMap(x))),
        evolutionChain: json["evolution_chain"] == null
            ? null
            : EvolutionChain.fromMap(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: json["flavor_text_entries"] == null
            ? null
            : List<FlavorTextEntry>.from(json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromMap(x))),
        formDescriptions: json["form_descriptions"] == null
            ? null
            : List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: json["genera"] == null
            ? null
            : List<Genus>.from(json["genera"].map((x) => Genus.fromMap(x))),
        generation: json["generation"] == null
            ? null
            : ColorSpecie.fromMap(json["generation"]),
        growthRate: json["growth_rate"] == null
            ? null
            : ColorSpecie.fromMap(json["growth_rate"]),
        habitat: json["habitat"] == null
            ? null
            : ColorSpecie.fromMap(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter:
            json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: json["names"] == null
            ? null
            : List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        order: json["order"],
        palParkEncounters: json["pal_park_encounters"] == null
            ? null
            : List<PalParkEncounter>.from(json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromMap(x))),
        pokedexNumbers: json["pokedex_numbers"] == null
            ? null
            : List<PokedexNumber>.from(
                json["pokedex_numbers"].map((x) => PokedexNumber.fromMap(x))),
        shape:
            json["shape"] == null ? null : ColorSpecie.fromMap(json["shape"]),
        varieties: json["varieties"] == null
            ? null
            : List<Variety>.from(
                json["varieties"].map((x) => Variety.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color?.toMap(),
        "egg_groups": eggGroups == null
            ? null
            : List<dynamic>.from(eggGroups!.map((x) => x.toMap())),
        "evolution_chain":
            evolutionChain?.toMap(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries": flavorTextEntries == null
            ? null
            : List<dynamic>.from(flavorTextEntries!.map((x) => x.toMap())),
        "form_descriptions": formDescriptions == null
            ? null
            : List<dynamic>.from(formDescriptions!.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": genera == null
            ? null
            : List<dynamic>.from(genera!.map((x) => x.toMap())),
        "generation": generation?.toMap(),
        "growth_rate": growthRate?.toMap(),
        "habitat": habitat?.toMap(),
        "has_gender_differences":
            hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": names == null
            ? null
            : List<dynamic>.from(names!.map((x) => x.toMap())),
        "order": order,
        "pal_park_encounters": palParkEncounters == null
            ? null
            : List<dynamic>.from(palParkEncounters!.map((x) => x.toMap())),
        "pokedex_numbers": pokedexNumbers == null
            ? null
            : List<dynamic>.from(pokedexNumbers!.map((x) => x.toMap())),
        "shape": shape?.toMap(),
        "varieties": varieties == null
            ? null
            : List<dynamic>.from(varieties!.map((x) => x.toMap())),
      };
}

class ColorSpecie {
  ColorSpecie({
    required this.name,
    required this.url,
  });

  String? name;
  String? url;

  factory ColorSpecie.fromJson(String str) =>
      ColorSpecie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ColorSpecie.fromMap(Map<String, dynamic> json) => ColorSpecie(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  String? url;

  factory EvolutionChain.fromJson(String str) =>
      EvolutionChain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EvolutionChain.fromMap(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  String? flavorText;
  ColorSpecie? language;
  ColorSpecie? version;

  factory FlavorTextEntry.fromJson(String str) =>
      FlavorTextEntry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: json["language"] == null
            ? null
            : ColorSpecie.fromMap(json["language"]),
        version: json["version"] == null
            ? null
            : ColorSpecie.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
        "language": language?.toMap(),
        "version": version?.toMap(),
      };
}

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  String? genus;
  ColorSpecie? language;

  factory Genus.fromJson(String str) => Genus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genus.fromMap(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: json["language"] == null
            ? null
            : ColorSpecie.fromMap(json["language"]),
      );

  Map<String, dynamic> toMap() => {
        "genus": genus,
        "language": language?.toMap(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  ColorSpecie? language;
  String? name;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : ColorSpecie.fromMap(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "language": language?.toMap(),
        "name": name,
      };
}

class PalParkEncounter {
  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  ColorSpecie? area;
  int? baseScore;
  int? rate;

  factory PalParkEncounter.fromJson(String str) =>
      PalParkEncounter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PalParkEncounter.fromMap(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: json["area"] == null ? null : ColorSpecie.fromMap(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toMap() => {
        "area": area?.toMap(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  int? entryNumber;
  ColorSpecie? pokedex;

  factory PokedexNumber.fromJson(String str) =>
      PokedexNumber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokedexNumber.fromMap(Map<String, dynamic> json) => PokedexNumber(
        entryNumber:
            json["entry_number"],
        pokedex: json["pokedex"] == null
            ? null
            : ColorSpecie.fromMap(json["pokedex"]),
      );

  Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokedex": pokedex?.toMap(),
      };
}

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  bool? isDefault;
  ColorSpecie? pokemon;

  factory Variety.fromJson(String str) => Variety.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Variety.fromMap(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: json["pokemon"] == null
            ? null
            : ColorSpecie.fromMap(json["pokemon"]),
      );

  Map<String, dynamic> toMap() => {
        "is_default": isDefault,
        "pokemon": pokemon?.toMap(),
      };
}
