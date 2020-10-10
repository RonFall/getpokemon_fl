import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/widget/retry_widget.dart';

import 'bloc/pokemon_bloc.dart';

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
