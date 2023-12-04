import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:pokedex_ofd2/models/models.dart';
import 'package:pokedex_ofd2/models/pokemon_evolution_chain.dart';
import 'package:pokedex_ofd2/models/pokemon_species.dart';
import 'package:rxdart/rxdart.dart';
import '../models/pokemon_items_details.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../models/pokemon_move_details.dart';
import '../models/pokemon_move_response.dart';

class PokemonsProvider extends ChangeNotifier {
  final String _baseUrl = 'pokeapi.co';

  List<Pokemon> originalPokemonList = [];
  Map<int, PokemonDetails> pokemonDetailsMap = {};

  List<PokemonDetails> onPokemonsListWithDetails = [];
  final onPokemonsListWithDetailsStream =
      BehaviorSubject<List<PokemonDetails>>();

  int maxPokemonsListWithDetails = 0;
  List<PokemonItemsDetails> onPokemonItems = [];
  int maxonPokemonItems = 0;
  List<PokemonBerryDetails> onPokemonBerrysDetails = [];
  List<PokemonMoveDetails> onPokemonMovesDetails = [];

  int maxPokemonBerrysDetails = 0;
  int maxPokemonItemsDetails = 0;
  int maxPokemons = 0;
  int maxPokemonMovesDetails = 0;

  final int _offsetPokemons = 0;
  final int _offsetItems = 0;
  final int _offsetBerrys = 0;
  final int _offsetMoves = 0;

  String? _nextOffsetPokemons;
  String? _nextOffsetItems;
  String? _nextOffsetBerrys;
  String? _nextOffsetMoves;

  final Map<int, PokemonItemsDetails> _itembyId = {};
  final Map<int, PokemonSpecies> _speciesbyIdpokemon = {};
  final Map<String, PokemonMoveDetails> _movebyName = {};
  final Map<int, PokemonEvolutionChain> _getEvolutionbyIdPokemon = {};

  bool isLoadingItems = false;
  bool isLoadingBerrys = false;
  bool isLoadingPokemons = false;
  bool isLoadingMoves = false;

  bool isRequestErrorItems = false;
  bool isRequestErrorBerrys = false;
  bool isRequestErrorPokemons = false;
  bool isRequestErrorMoves = false;

  static const int maxItemPokemons = 10250;
  static const int _limit = 20;

  PokemonsProvider() {
    getPokemons();
    getPokemonItems();
    getPokemonBerry();
    getPokemonMoves();
  }

  Future<Map> _getMapData(String endpoint,
      [String urlNext = '', int offset = 0, int limit = _limit]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'limit': '$limit',
      'offset': '$offset',
    });

    final response;

    if (urlNext == "") {
      //response = await http.get(url);
      response = await Dio().get(
        url.toString(),
        options: buildCacheOptions(
          const Duration(days: 7),
        ),
      );
    } else {
      //final nextUri = Uri.parse(urlNext);
      //response = await http.get(nextUri);
      response = await Dio().get(
        urlNext,
        options: buildCacheOptions(
          const Duration(days: 7),
        ),
      );
    }

    return response.data;
  }

  void getPokemons([bool nextPage = false]) async {
    if (isLoadingPokemons || (nextPage && _nextOffsetPokemons == null)) return;

    isLoadingPokemons = true;
    isRequestErrorPokemons = false;

    try {
      final jsonData;

      if (nextPage) {
        jsonData = await _getMapData('/api/v2/pokemon', _nextOffsetPokemons!);
      } else {
        originalPokemonList.clear();
        pokemonDetailsMap.clear();
        jsonData = await _getMapData('/api/v2/pokemon');
      }

      List<Pokemon> newPokemons = Pokemon.fromMapList(jsonData['results']);
      originalPokemonList.addAll(newPokemons);

      final pokemonResponse = PokemonResponse.fromMap(jsonData);
      _nextOffsetPokemons = pokemonResponse.next;
      maxPokemons = pokemonResponse.count;

      fillDetails(newPokemons);
      notifyListeners();

      isLoadingPokemons = false;
    } catch (e) {
      isLoadingPokemons = false;
      isRequestErrorPokemons = true;
      notifyListeners();
      rethrow;
    }
  }

  /*
  fillDetails(List<Pokemon> results) async {
    for (var element in results) {
      getDetails(element.url);
    }
  }
  */
  void fillDetails(List<Pokemon> newPokemons) async {
    for (var i = 0; i < newPokemons.length; i++) {
      if (int.parse(newPokemons[i].id) < maxItemPokemons) {
        getDetails(
            newPokemons[i].url, originalPokemonList.indexOf(newPokemons[i]));
      }
    }
  }

  void getDetails(String url, int index) async {
    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );
    final PokemonDetails pokemonDetails = PokemonDetails.fromMap(response.data);

    pokemonDetailsMap[index] = pokemonDetails;

    if (pokemonDetailsMap.length == originalPokemonList.length) {
      onPokemonsListWithDetails = List<PokemonDetails>.generate(
          originalPokemonList.length, (index) => pokemonDetailsMap[index]!);
      onPokemonsListWithDetailsStream.add(onPokemonsListWithDetails);
      notifyListeners();
    }
  }

  void getPokemonItems([bool nextPage = false]) async {
    if (isLoadingItems || (nextPage && _nextOffsetItems == null)) return;

    isLoadingItems = true;
    isRequestErrorItems = false;

    print('parametro: ' + _nextOffsetItems.toString());

    try {
      final jsonData;

      if (nextPage) {
        jsonData = await _getMapData('/api/v2/item', _nextOffsetItems!);
      } else {
        jsonData = await _getMapData('/api/v2/item');
      }
      //final pokemonItemsResponse = PokemonItemsResponse.fromJson(jsonData);
      final pokemonItemsResponse = PokemonItemsResponse.fromMap(jsonData);
      _nextOffsetItems = pokemonItemsResponse.next;
      print('_nextOffsetItems: ' + _nextOffsetItems.toString());
      maxPokemonItemsDetails = pokemonItemsResponse.count;

      fillDetailsItems(pokemonItemsResponse.results);

      notifyListeners();
      isLoadingItems = false;
    } catch (e) {
      isRequestErrorItems = true;
      isLoadingItems = false;
      notifyListeners();
      rethrow;
    }
  }

  fillDetailsItems(List<PokemonItems> results) async {
    for (var element in results) {
      getDetailsItems(element.url);
    }
  }

  getDetailsItems(String url) async {
    //final response = await http.get(Uri.parse(url));

    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    final PokemonItemsDetails pokemonItemDetails =
        PokemonItemsDetails.fromMap(response.data);
    onPokemonItems.add(pokemonItemDetails);

    notifyListeners();
  }

  void getPokemonBerry([bool nextPage = false]) async {
    if (isLoadingBerrys || (nextPage && _nextOffsetBerrys == null)) return;

    print('parametro: ' + _nextOffsetBerrys.toString());

    isLoadingBerrys = true;
    isRequestErrorBerrys = false;

    try {
      final jsonData;
      if (nextPage) {
        jsonData = await _getMapData('/api/v2/berry', _nextOffsetBerrys!);
      } else {
        jsonData = await _getMapData('/api/v2/berry');
      }

      //final pokemonBerrysResponse = PokemonBerrysResponse.fromJson(jsonData);
      final pokemonBerrysResponse = PokemonBerrysResponse.fromMap(jsonData);
      _nextOffsetBerrys = pokemonBerrysResponse.next;
      print('_nextOffsetItems: ' + _nextOffsetItems.toString());
      maxPokemonBerrysDetails = pokemonBerrysResponse.count;

      fillBerrys(pokemonBerrysResponse.results);

      notifyListeners();
      isLoadingBerrys = false;
    } catch (e) {
      isRequestErrorBerrys = true;
      isLoadingBerrys = false;
      notifyListeners();
      rethrow;
    }
  }

  fillBerrys(List<PokemonBerrys> results) async {
    for (var element in results) {
      getBerrys(element.url);
    }
  }

  getBerrys(String url) async {
    if (url != "") {
      //final response = await http.get(Uri.parse(url));

      final response = await Dio().get(
        url,
        options: buildCacheOptions(
          const Duration(days: 7),
        ),
      );

      final PokemonBerryDetails pokemonBerrysDetails =
          PokemonBerryDetails.fromMap(response.data);
      onPokemonBerrysDetails.add(pokemonBerrysDetails);
      notifyListeners();
    }
  }

  Future<PokemonItemsDetails> getItembyUrl2(int idItem, String url) async {
    if (_itembyId.containsKey(idItem)) return _itembyId[idItem]!;

    //final response = await http.get(Uri.parse(url));

    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    final PokemonItemsDetails itemResponse =
        PokemonItemsDetails.fromMap(response.data);

    _itembyId[idItem] = itemResponse;
    return itemResponse;
  }

  Future<PokemonSpecies> getSpeciesbyUrl(int idPokemon, String url) async {
    if (_speciesbyIdpokemon.containsKey(idPokemon)) {
      return _speciesbyIdpokemon[idPokemon]!;
    }

    //final response = await http.get(Uri.parse(url));
    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    final PokemonSpecies speciesResponse =
        PokemonSpecies.fromMap(response.data);

    _speciesbyIdpokemon[idPokemon] = speciesResponse;

    //Inicio evolution
    if (speciesResponse.evolutionChain != null &&
        speciesResponse.evolutionChain!.url != null &&
        speciesResponse.evolutionChain!.url!.isNotEmpty &&
        !_getEvolutionbyIdPokemon.containsKey(idPokemon)) {
      //final responseEvolution =
      //    await http.get(Uri.parse(speciesResponse.evolutionChain!.url!));

      final responseEvolution = await Dio().get(
        speciesResponse.evolutionChain!.url!,
        options: buildCacheOptions(
          const Duration(days: 7),
        ),
      );

      final PokemonEvolutionChain pokemonEvolutionChainResponse =
          PokemonEvolutionChain.fromMap(responseEvolution.data);

      _getEvolutionbyIdPokemon[speciesResponse.id!] =
          pokemonEvolutionChainResponse;
    }

    return speciesResponse;
  }

  Future<PokemonMoveDetails> getMovebyUrl(String name, String url) async {
    if (_movebyName.containsKey(name)) {
      return _movebyName[name]!;
    }

    //final response = await http.get(Uri.parse(url));

    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    final PokemonMoveDetails moveDetailsResponse =
        PokemonMoveDetails.fromJson(response.data);

    _movebyName[name] = moveDetailsResponse;

    return moveDetailsResponse;
  }

  PokemonEvolutionChain? getEvolutionbyIdPokemon(int id) {
    if (_getEvolutionbyIdPokemon.containsKey(id)) {
      return _getEvolutionbyIdPokemon[id]!;
    } else {
      return null;
    }
  }

//////desde aqui

  void getPokemonMoves([bool nextPage = false]) async {
    if (isLoadingMoves || (nextPage && _nextOffsetMoves == null)) return;

    isLoadingMoves = true;
    isRequestErrorMoves = false;

    try {
      final jsonData;

      if (nextPage) {
        jsonData = await _getMapData('/api/v2/move', _nextOffsetMoves!);
      } else {
        jsonData = await _getMapData('/api/v2/move');
      }

      final pokemonMovesResponse = PokemonMoveResponse.fromMap(jsonData);
      _nextOffsetMoves = pokemonMovesResponse.next;
      maxPokemonMovesDetails = pokemonMovesResponse.count;

      fillDetailsMoves(pokemonMovesResponse.results);

      notifyListeners();
      isLoadingMoves = false;
    } catch (e) {
      isRequestErrorMoves = true;
      isLoadingMoves = false;
      notifyListeners();
      rethrow;
    }
  }

  fillDetailsMoves(List<MoveResult> results) async {
    for (var element in results) {
      getDetailsMoves(element.url);
    }
  }

  getDetailsMoves(String url) async {
    //final response = await http.get(Uri.parse(url));

    final response = await Dio().get(
      url,
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    final PokemonMoveDetails pokemonMovesDetails =
        PokemonMoveDetails.fromJson(response.data);
    onPokemonMovesDetails.add(pokemonMovesDetails);
    notifyListeners();
  }
}
