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
            json["base_happiness"] == null ? null : json["base_happiness"]!,
        captureRate:
            json["capture_rate"] == null ? null : json["capture_rate"]!,
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
        formsSwitchable: json["forms_switchable"] ?? null,
        genderRate: json["gender_rate"] == null ? null : json["gender_rate"],
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
        hasGenderDifferences: json["has_gender_differences"] == null
            ? null
            : json["has_gender_differences"],
        hatchCounter:
            json["hatch_counter"] == null ? null : json["hatch_counter"],
        id: json["id"] == null ? null : json["id"],
        isBaby: json["is_baby"] == null ? null : json["is_baby"],
        isLegendary: json["is_legendary"] == null ? null : json["is_legendary"],
        isMythical: json["is_mythical"] == null ? null : json["is_mythical"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null
            ? null
            : List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        order: json["order"] == null ? null : json["order"],
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
        "base_happiness": baseHappiness == null ? null : baseHappiness,
        "capture_rate": captureRate == null ? null : captureRate,
        "color": color == null ? null : color!.toMap(),
        "egg_groups": eggGroups == null
            ? null
            : List<dynamic>.from(eggGroups!.map((x) => x.toMap())),
        "evolution_chain":
            evolutionChain == null ? null : evolutionChain!.toMap(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries": flavorTextEntries == null
            ? null
            : List<dynamic>.from(flavorTextEntries!.map((x) => x.toMap())),
        "form_descriptions": formDescriptions == null
            ? null
            : List<dynamic>.from(formDescriptions!.map((x) => x)),
        "forms_switchable": formsSwitchable == null ? null : formsSwitchable,
        "gender_rate": genderRate == null ? null : genderRate,
        "genera": genera == null
            ? null
            : List<dynamic>.from(genera!.map((x) => x.toMap())),
        "generation": generation == null ? null : generation!.toMap(),
        "growth_rate": growthRate == null ? null : growthRate!.toMap(),
        "habitat": habitat == null ? null : habitat!.toMap(),
        "has_gender_differences":
            hasGenderDifferences == null ? null : hasGenderDifferences,
        "hatch_counter": hatchCounter == null ? null : hatchCounter,
        "id": id == null ? null : id,
        "is_baby": isBaby == null ? null : isBaby,
        "is_legendary": isLegendary == null ? null : isLegendary,
        "is_mythical": isMythical == null ? null : isMythical,
        "name": name == null ? null : name,
        "names": names == null
            ? null
            : List<dynamic>.from(names!.map((x) => x.toMap())),
        "order": order == null ? null : order,
        "pal_park_encounters": palParkEncounters == null
            ? null
            : List<dynamic>.from(palParkEncounters!.map((x) => x.toMap())),
        "pokedex_numbers": pokedexNumbers == null
            ? null
            : List<dynamic>.from(pokedexNumbers!.map((x) => x.toMap())),
        "shape": shape == null ? null : shape!.toMap(),
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
        name: json["name"] == null ? null : json["name"]!,
        url: json["url"] == null ? null : json["url"]!,
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
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
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
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
        flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
        language: json["language"] == null
            ? null
            : ColorSpecie.fromMap(json["language"]),
        version: json["version"] == null
            ? null
            : ColorSpecie.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "flavor_text": flavorText == null ? null : flavorText,
        "language": language == null ? null : language!.toMap(),
        "version": version == null ? null : version!.toMap(),
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
        genus: json["genus"] == null ? null : json["genus"],
        language: json["language"] == null
            ? null
            : ColorSpecie.fromMap(json["language"]),
      );

  Map<String, dynamic> toMap() => {
        "genus": genus == null ? null : genus,
        "language": language == null ? null : language!.toMap(),
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
        name: json["name"] == null ? null : json["name"]!,
      );

  Map<String, dynamic> toMap() => {
        "language": language == null ? null : language!.toMap(),
        "name": name ?? null,
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
        baseScore: json["base_score"] == null ? null : json["base_score"]!,
        rate: json["rate"] == null ? null : json["rate"]!,
      );

  Map<String, dynamic> toMap() => {
        "area": area == null ? null : area!.toMap(),
        "base_score": baseScore ?? null,
        "rate": rate ?? null,
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
            json["entry_number"] == null ? null : json["entry_number"]!,
        pokedex: json["pokedex"] == null
            ? null
            : ColorSpecie.fromMap(json["pokedex"]),
      );

  Map<String, dynamic> toMap() => {
        "entry_number": entryNumber ?? null,
        "pokedex": pokedex == null ? null : pokedex!.toMap(),
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
        isDefault: json["is_default"] == null ? null : json["is_default"]!,
        pokemon: json["pokemon"] == null
            ? null
            : ColorSpecie.fromMap(json["pokemon"]),
      );

  Map<String, dynamic> toMap() => {
        "is_default": isDefault ?? null,
        "pokemon": pokemon == null ? null : pokemon!.toMap(),
      };
}
