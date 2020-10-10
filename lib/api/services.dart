import 'dart:convert';

import 'package:getpokemon_fl/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class PokemonRepo {
  Future<PokemonModel> getPokemon(String name);
}

class PokemonServices implements PokemonRepo {

  @override
  Future<PokemonModel> getPokemon(String name) async {
    var response = await http.get('https://pokeapi.co/api/v2/pokemon/$name');
    var pokemon = PokemonModel.fromJson(json.decode(response.body));
    return pokemon;
  }
}
