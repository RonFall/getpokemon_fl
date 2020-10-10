import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getpokemon_fl/api/exceptions.dart';
import 'package:getpokemon_fl/api/services.dart';
import 'package:getpokemon_fl/model/pokemon_model.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepo pokemonRepo;

  PokemonBloc({this.pokemonRepo}) : super(PokemonInitial());

  PokemonModel pokemon;

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is InitialPokemon) {
      yield PokemonInitial();
      try {
        pokemon = await pokemonRepo.getPokemon(event.text);
        yield PokemonLoaded(pokemon: pokemon);
      } on SocketException {
        yield PokemonError(
          error: NoInternetException('No Internet'),
        );
      } on HttpException {
        yield PokemonError(
          error: NoServiceFoundException('No Service Found'),
        );
      } on FormatException {
        yield PokemonError(
          error: InvalidFormatException('Invalid Response Format'),
        );
      } catch (e) {
        yield PokemonError(
          error: UnknownException('Unknown Error'),
        );
      }
    }
  }
}
