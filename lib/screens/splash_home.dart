import 'package:flutter/material.dart';
import 'package:pokedex_ofd2/utils/images.dart';

import 'home_screen.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 3.0).animate(_controller),
            child: Container(
              height: maxWidth / 6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AppGeneralImages.pokeballColor,
                      fit: BoxFit.fitHeight)),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
