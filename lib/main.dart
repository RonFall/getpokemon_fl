import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/bloc/pokemon_bloc.dart';
import 'package:getpokemon_fl/widget/bottom_navbar_widget.dart';

import 'api/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetPokemon',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PokemonBloc(pokemonRepo: PokemonServices()),
        child: BottomNavBar(),
      ),
    );
  }
}
