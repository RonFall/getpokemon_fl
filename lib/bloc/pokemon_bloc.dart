import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:getpokemon_fl/model/pokemon_model.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());

  PokemonState get initialState => PokemonInitial();

  var pokemon = PokemonModel();

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is InitialPokemon) {
      yield PokemonInitial();
      await _fetch(event.text);
      yield PokemonLoaded(pokemon);
    }
  }

  Future<PokemonModel> _fetch(String text) async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon/$text');
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
