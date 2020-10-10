part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final PokemonModel pokemon;

  PokemonLoaded({this.pokemon});
}

class PokemonError extends PokemonState {
  final error;
  PokemonError({this.error});
}
