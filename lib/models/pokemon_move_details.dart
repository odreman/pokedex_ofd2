class PokemonMoveDetails {
  final int? accuracy;
  final ContestEffect? contestEffect;
  final ContestType? contestType;
  final DamageClass? damageClass;
  final int? effectChance;
  final List<dynamic>? effectChanges;
  final List<EffectEntries>? effectEntries;
  final List<FlavorTextEntries>? flavorTextEntries;
  final Generation? generation;
  final int? id;
  final List<LearnedByPokemon>? learnedByPokemon;
  final List<Machines>? machines;
  final Meta? meta;
  final String? name;
  final List<Names>? names;
  final List<dynamic>? pastValues;
  final int? power;
  final int? pp;
  final int? priority;
  final List<dynamic>? statChanges;
  final SuperContestEffect? superContestEffect;
  final Target? target;
  final Type? type;

  PokemonMoveDetails({
    this.accuracy,
    this.contestEffect,
    this.contestType,
    this.damageClass,
    this.effectChance,
    this.effectChanges,
    this.effectEntries,
    this.flavorTextEntries,
    this.generation,
    this.id,
    this.learnedByPokemon,
    this.machines,
    this.meta,
    this.name,
    this.names,
    this.pastValues,
    this.power,
    this.pp,
    this.priority,
    this.statChanges,
    this.superContestEffect,
    this.target,
    this.type,
  });

  PokemonMoveDetails.fromJson(Map<String, dynamic> json)
      : accuracy = json['accuracy'] as int?,
        contestEffect =
            (json['contest_effect'] as Map<String, dynamic>?) != null
                ? ContestEffect.fromJson(
                    json['contest_effect'] as Map<String, dynamic>)
                : null,
        contestType = (json['contest_type'] as Map<String, dynamic>?) != null
            ? ContestType.fromJson(json['contest_type'] as Map<String, dynamic>)
            : null,
        damageClass = (json['damage_class'] as Map<String, dynamic>?) != null
            ? DamageClass.fromJson(json['damage_class'] as Map<String, dynamic>)
            : null,
        effectChance = json['effect_chance'] as int?,
        effectChanges = json['effect_changes'] as List?,
        effectEntries = (json['effect_entries'] as List?)
            ?.map((dynamic e) =>
                EffectEntries.fromJson(e as Map<String, dynamic>))
            .toList(),
        flavorTextEntries = (json['flavor_text_entries'] as List?)
            ?.map((dynamic e) =>
                FlavorTextEntries.fromJson(e as Map<String, dynamic>))
            .toList(),
        generation = (json['generation'] as Map<String, dynamic>?) != null
            ? Generation.fromJson(json['generation'] as Map<String, dynamic>)
            : null,
        id = json['id'] as int?,
        learnedByPokemon = (json['learned_by_pokemon'] as List?)
            ?.map((dynamic e) =>
                LearnedByPokemon.fromJson(e as Map<String, dynamic>))
            .toList(),
        machines = (json['machines'] as List?)
            ?.map((dynamic e) => Machines.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta = (json['meta'] as Map<String, dynamic>?) != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        name = json['name'] as String?,
        names = (json['names'] as List?)
            ?.map((dynamic e) => Names.fromJson(e as Map<String, dynamic>))
            .toList(),
        pastValues = json['past_values'] as List?,
        power = json['power'] as int?,
        pp = json['pp'] as int?,
        priority = json['priority'] as int?,
        statChanges = json['stat_changes'] as List?,
        superContestEffect =
            (json['super_contest_effect'] as Map<String, dynamic>?) != null
                ? SuperContestEffect.fromJson(
                    json['super_contest_effect'] as Map<String, dynamic>)
                : null,
        target = (json['target'] as Map<String, dynamic>?) != null
            ? Target.fromJson(json['target'] as Map<String, dynamic>)
            : null,
        type = (json['type'] as Map<String, dynamic>?) != null
            ? Type.fromJson(json['type'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'accuracy': accuracy,
        'contest_effect': contestEffect?.toJson(),
        'contest_type': contestType?.toJson(),
        'damage_class': damageClass?.toJson(),
        'effect_chance': effectChance,
        'effect_changes': effectChanges,
        'effect_entries': effectEntries?.map((e) => e.toJson()).toList(),
        'flavor_text_entries':
            flavorTextEntries?.map((e) => e.toJson()).toList(),
        'generation': generation?.toJson(),
        'id': id,
        'learned_by_pokemon': learnedByPokemon?.map((e) => e.toJson()).toList(),
        'machines': machines?.map((e) => e.toJson()).toList(),
        'meta': meta?.toJson(),
        'name': name,
        'names': names?.map((e) => e.toJson()).toList(),
        'past_values': pastValues,
        'power': power,
        'pp': pp,
        'priority': priority,
        'stat_changes': statChanges,
        'super_contest_effect': superContestEffect?.toJson(),
        'target': target?.toJson(),
        'type': type?.toJson()
      };
}

class Normal {
  final List<UseAfter>? useAfter;
  final List<UseBefore>? useBefore;

  Normal({
    this.useAfter,
    this.useBefore,
  });

  Normal.fromJson(Map<String, dynamic> json)
      : useAfter = (json['use_after'] as List?)
            ?.map((dynamic e) => UseAfter.fromJson(e as Map<String, dynamic>))
            .toList(),
        useBefore = (json['use_before'] as List?)
            ?.map((dynamic e) => UseBefore.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'use_after': useAfter?.map((e) => e.toJson()).toList(),
        'use_before': useBefore?.map((e) => e.toJson()).toList()
      };
}

class UseAfter {
  final String? name;
  final String? url;

  UseAfter({
    this.name,
    this.url,
  });

  UseAfter.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class UseBefore {
  final String? name;
  final String? url;

  UseBefore({
    this.name,
    this.url,
  });

  UseBefore.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Super {
  final dynamic useAfter;
  final dynamic useBefore;

  Super({
    this.useAfter,
    this.useBefore,
  });

  Super.fromJson(Map<String, dynamic> json)
      : useAfter = json['use_after'],
        useBefore = json['use_before'];

  Map<String, dynamic> toJson() =>
      {'use_after': useAfter, 'use_before': useBefore};
}

class ContestEffect {
  final String? url;

  ContestEffect({
    this.url,
  });

  ContestEffect.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'url': url};
}

class ContestType {
  final String? name;
  final String? url;

  ContestType({
    this.name,
    this.url,
  });

  ContestType.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class DamageClass {
  final String? name;
  final String? url;

  DamageClass({
    this.name,
    this.url,
  });

  DamageClass.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class EffectEntries {
  final String? effect;
  final Language? language;
  final String? shortEffect;

  EffectEntries({
    this.effect,
    this.language,
    this.shortEffect,
  });

  EffectEntries.fromJson(Map<String, dynamic> json)
      : effect = json['effect'] as String?,
        language = (json['language'] as Map<String, dynamic>?) != null
            ? Language.fromJson(json['language'] as Map<String, dynamic>)
            : null,
        shortEffect = json['short_effect'] as String?;

  Map<String, dynamic> toJson() => {
        'effect': effect,
        'language': language?.toJson(),
        'short_effect': shortEffect
      };
}

class Language {
  final String? name;
  final String? url;

  Language({
    this.name,
    this.url,
  });

  Language.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class FlavorTextEntries {
  final String? flavorText;
  final Language? language;
  final VersionGroup? versionGroup;

  FlavorTextEntries({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  FlavorTextEntries.fromJson(Map<String, dynamic> json)
      : flavorText = json['flavor_text'] as String?,
        language = (json['language'] as Map<String, dynamic>?) != null
            ? Language.fromJson(json['language'] as Map<String, dynamic>)
            : null,
        versionGroup = (json['version_group'] as Map<String, dynamic>?) != null
            ? VersionGroup.fromJson(
                json['version_group'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'flavor_text': flavorText,
        'language': language?.toJson(),
        'version_group': versionGroup?.toJson()
      };
}

class Languagex {
  final String? name;
  final String? url;

  Languagex({
    this.name,
    this.url,
  });

  Languagex.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class VersionGroup {
  final String? name;
  final String? url;

  VersionGroup({
    this.name,
    this.url,
  });

  VersionGroup.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Generation {
  final String? name;
  final String? url;

  Generation({
    this.name,
    this.url,
  });

  Generation.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class LearnedByPokemon {
  final String? name;
  final String? url;

  LearnedByPokemon({
    this.name,
    this.url,
  });

  LearnedByPokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Machines {
  final Machine? machine;
  final VersionGroup? versionGroup;

  Machines({
    this.machine,
    this.versionGroup,
  });

  Machines.fromJson(Map<String, dynamic> json)
      : machine = (json['machine'] as Map<String, dynamic>?) != null
            ? Machine.fromJson(json['machine'] as Map<String, dynamic>)
            : null,
        versionGroup = (json['version_group'] as Map<String, dynamic>?) != null
            ? VersionGroup.fromJson(
                json['version_group'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'machine': machine?.toJson(), 'version_group': versionGroup?.toJson()};
}

class Machine {
  final String? url;

  Machine({
    this.url,
  });

  Machine.fromJson(Map<String, dynamic> json) : url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'url': url};
}

class VersionGroupx {
  final String? name;
  final String? url;

  VersionGroupx({
    this.name,
    this.url,
  });

  VersionGroupx.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Meta {
  final Ailment? ailment;
  final int? ailmentChance;
  final Category? category;
  final int? critRate;
  final int? drain;
  final int? flinchChance;
  final int? healing;
  final dynamic maxHits;
  final dynamic maxTurns;
  final dynamic minHits;
  final dynamic minTurns;
  final int? statChance;

  Meta({
    this.ailment,
    this.ailmentChance,
    this.category,
    this.critRate,
    this.drain,
    this.flinchChance,
    this.healing,
    this.maxHits,
    this.maxTurns,
    this.minHits,
    this.minTurns,
    this.statChance,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : ailment = (json['ailment'] as Map<String, dynamic>?) != null
            ? Ailment.fromJson(json['ailment'] as Map<String, dynamic>)
            : null,
        ailmentChance = json['ailment_chance'] as int?,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        critRate = json['crit_rate'] as int?,
        drain = json['drain'] as int?,
        flinchChance = json['flinch_chance'] as int?,
        healing = json['healing'] as int?,
        maxHits = json['max_hits'],
        maxTurns = json['max_turns'],
        minHits = json['min_hits'],
        minTurns = json['min_turns'],
        statChance = json['stat_chance'] as int?;

  Map<String, dynamic> toJson() => {
        'ailment': ailment?.toJson(),
        'ailment_chance': ailmentChance,
        'category': category?.toJson(),
        'crit_rate': critRate,
        'drain': drain,
        'flinch_chance': flinchChance,
        'healing': healing,
        'max_hits': maxHits,
        'max_turns': maxTurns,
        'min_hits': minHits,
        'min_turns': minTurns,
        'stat_chance': statChance
      };
}

class Ailment {
  final String? name;
  final String? url;

  Ailment({
    this.name,
    this.url,
  });

  Ailment.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Category {
  final String? name;
  final String? url;

  Category({
    this.name,
    this.url,
  });

  Category.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Names {
  final Language? language;
  final String? name;

  Names({
    this.language,
    this.name,
  });

  Names.fromJson(Map<String, dynamic> json)
      : language = (json['language'] as Map<String, dynamic>?) != null
            ? Language.fromJson(json['language'] as Map<String, dynamic>)
            : null,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() =>
      {'language': language?.toJson(), 'name': name};
}

class SuperContestEffect {
  final String? url;

  SuperContestEffect({
    this.url,
  });

  SuperContestEffect.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'url': url};
}

class Target {
  final String? name;
  final String? url;

  Target({
    this.name,
    this.url,
  });

  Target.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Type {
  final String? name;
  final String? url;

  Type({
    this.name,
    this.url,
  });

  Type.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
