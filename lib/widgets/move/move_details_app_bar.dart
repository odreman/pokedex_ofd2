import 'package:flutter/material.dart';

class MoveDetailsAppBar extends StatelessWidget {
  const MoveDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepOrange,
      expandedHeight: 100,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.deepOrange,
          child: const Text(
            'Movements',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
