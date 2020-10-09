part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final PokemonModel pokemon;

  PokemonLoaded(this.pokemon);
}
