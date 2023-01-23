import 'package:flutter/material.dart';

Widget propertyRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
        ),
        Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ))
      ],
    ),
  );
}
