import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/bloc/pokemon_bloc.dart';
import 'package:getpokemon_fl/widget/retry_widget.dart';

import '../utils.dart';

class PokemonRandomPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView(
        children: <Widget>[
          pageHeader("Случайное", Colors.white),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
                  if (state is PokemonError) {
                    return Retry(
                      message: "Что-то пошло не так...",
                    );
                  }
                  if (state is PokemonInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PokemonLoaded) {
                    var name = state.pokemon.name;
                    var image = state.pokemon.sprites.other.officialArtwork.frontDefault;
                    var exp = state.pokemon.baseExperience;
                    var height = state.pokemon.height;
                    var weight = state.pokemon.weight;
                    return onRequestPokemon(image, name, exp, height, weight);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 80, right: 80),
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlatButton(
                      onPressed: () {
                        var rand = Random().nextInt(1050);
                        context.bloc<PokemonBloc>().add(InitialPokemon(text: rand.toString()));
                      },
                      color: Colors.blue,
                      child: Text(
                        "Найти",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final txtStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);

  onRequestPokemon(image, name, exp, height, weight) => Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Image(
              width: 200,
              height: 160,
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            Container(
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text(
                      "Имя покемона: $name",
                      style: txtStyle,
                    ),
                    Text(
                      "Опыт: $exp",
                      style: txtStyle,
                    ),
                    Text(
                      "Рост: $height",
                      style: txtStyle,
                    ),
                    Text(
                      "Вес: $weight",
                      style: txtStyle,
                    ),
                  ],
                ),
            ),
          ],
        ),
      );
}
