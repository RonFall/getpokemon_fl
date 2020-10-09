part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class InitialPokemon extends PokemonEvent {
  final String text;

  InitialPokemon({this.text});
}
