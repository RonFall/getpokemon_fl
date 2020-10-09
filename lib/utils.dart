import 'package:flutter/material.dart';

pageHeader(String text, Color color) => Container(
  margin: const EdgeInsets.only(top: 20),
  child: Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 42,
    ),
  ),
);