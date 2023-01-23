import 'dart:convert';

class PokemonBerryDetails {
  PokemonBerryDetails({
    required this.firmness,
    required this.flavors,
    required this.growthTime,
    required this.id,
    required this.item,
    required this.maxHarvest,
    required this.name,
    required this.naturalGiftPower,
    required this.naturalGiftType,
    required this.size,
    required this.smoothness,
    required this.soilDryness,
  });

  BerryFirmness firmness;
  List<BerryFlavor> flavors;
  int growthTime;
  int id;
  BerryFirmness item;
  int maxHarvest;
  String name;
  int naturalGiftPower;
  BerryFirmness naturalGiftType;
  int size;
  int smoothness;
  int soilDryness;

  get sprites {
    if (name != "") {
      return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$name-berry.png';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get idItem {
    final data = item.url.split('/');
    data.removeLast();
    int id = 0;
    try {
      id = int.parse(data.last);
    } catch (e) {
      print('id no integer');
    }
    return id;
  }

  factory PokemonBerryDetails.fromJson(String str) =>
      PokemonBerryDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonBerryDetails.fromMap(Map<String, dynamic> json) =>
      PokemonBerryDetails(
        firmness: BerryFirmness.fromMap(json["firmness"]),
        flavors: List<BerryFlavor>.from(
            json["flavors"].map((x) => BerryFlavor.fromMap(x))),
        growthTime: json["growth_time"],
        id: json["id"],
        item: BerryFirmness.fromMap(json["item"]),
        maxHarvest: json["max_harvest"],
        name: json["name"],
        naturalGiftPower: json["natural_gift_power"],
        naturalGiftType: BerryFirmness.fromMap(json["natural_gift_type"]),
        size: json["size"],
        smoothness: json["smoothness"],
        soilDryness: json["soil_dryness"],
      );

  Map<String, dynamic> toMap() => {
        "firmness": firmness.toMap(),
        "flavors": List<dynamic>.from(flavors.map((x) => x.toMap())),
        "growth_time": growthTime,
        "id": id,
        "item": item.toMap(),
        "max_harvest": maxHarvest,
        "name": name,
        "natural_gift_power": naturalGiftPower,
        "natural_gift_type": naturalGiftType.toMap(),
        "size": size,
        "smoothness": smoothness,
        "soil_dryness": soilDryness,
      };
}

class BerryFirmness {
  BerryFirmness({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory BerryFirmness.fromJson(String str) =>
      BerryFirmness.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BerryFirmness.fromMap(Map<String, dynamic> json) => BerryFirmness(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class BerryFlavor {
  BerryFlavor({
    required this.flavor,
    required this.potency,
  });

  BerryFirmness flavor;
  int potency;

  factory BerryFlavor.fromJson(String str) =>
      BerryFlavor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BerryFlavor.fromMap(Map<String, dynamic> json) => BerryFlavor(
        flavor: BerryFirmness.fromMap(json["flavor"]),
        potency: json["potency"],
      );

  Map<String, dynamic> toMap() => {
        "flavor": flavor.toMap(),
        "potency": potency,
      };
}
