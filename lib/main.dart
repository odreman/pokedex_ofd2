import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:pokedex_ofd2/providers/pokedex_provider.dart';
import 'package:pokedex_ofd2/screens/berry_details_screen.dart';
import 'package:pokedex_ofd2/screens/berry_screen.dart';

import 'package:pokedex_ofd2/screens/pokemon_details_screen.dart';
import 'package:pokedex_ofd2/screens/home_screen.dart';
import 'package:pokedex_ofd2/screens/item_details_screen.dart';
import 'package:pokedex_ofd2/screens/items_screen.dart';
import 'package:pokedex_ofd2/screens/move_details_screen.dart';
import 'package:pokedex_ofd2/screens/pokemons_screen.dart';
import 'package:pokedex_ofd2/screens/splash_home.dart';
import 'package:provider/provider.dart';

void main() async {
  //var path = getApplicationDocumentsDirectory();
  //WidgetsFlutterBinding.ensureInitialized();
  //Hive.registerAdapter(PokemonAdapter());
  //Hive.registerAdapter(PokemonAdapter());

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonsProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex OFD',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (_) => const SplashHome(),
        'home': (_) => const HomeScreen(),
        'pokemonList': (_) => const PokemonsScreen(),
        'detailsPokemon': (_) => const PokemonDetailsScreen(),
        'itemList': (_) => const ItemsScreen(),
        'itemDetails': (_) => const ItemDetailsScreen(),
        'berryList': (_) => const BerryScreen(),
        'berryDetails': (_) => const BerryDetailsScreen(),
        'MoveDetails': (_) => const MoveDetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.deepOrange),
      ),
    );
  }
}
