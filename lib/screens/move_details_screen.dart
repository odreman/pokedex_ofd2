import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/move/move_details_app_bar.dart';
import '../widgets/move/move_details_contents.dart';

class MoveDetailsScreen extends StatelessWidget {
  const MoveDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Move move = ModalRoute.of(context)!.settings.arguments as Move;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const MoveDetailsAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          MoveDetailsContents(move: move),
        ])),
      ],
    ));
  }
}
