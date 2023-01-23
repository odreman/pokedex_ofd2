import 'package:flutter/material.dart';

Widget setTitleCard(String title, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Text(
      title,
      style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 22),
    ),
  );
}
