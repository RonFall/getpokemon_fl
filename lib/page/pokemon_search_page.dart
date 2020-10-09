import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/bloc/pokemon_bloc.dart';

import '../utils.dart';

class PokemonSearchPage extends StatefulWidget {

  @override
  _PokemonSearchPageState createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  final searchController = TextEditingController();
  var _bloc;

  @override
  void initState() {
    this._bloc = PokemonBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView(
        children: <Widget>[
          pageHeader("Поиск", Colors.white),
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
            child: BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
              if (state is PokemonInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PokemonLoaded) {
                return Column(
                  children: [
                    TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black54),
                            hintText: "Имя покемона...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                        controller: searchController,
                        // onChanged: (text) {
                        //   text = text.toLowerCase();
                        //   if (text == state.name) {
                        //     Card(
                        //       elevation: 2.0,
                        //       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        //       child: Container(
                        //         child: ListTile(
                        //           title: Text(state.pokemon.name),
                        //           subtitle: Text(state.pokemon.baseExperience.toString()),
                        //           leading: CircleAvatar(child: Text(state.pokemon.id.toString())),
                        //         ),
                        //       ),
                        //     );
                        //   }
                        // }
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 40,
                      width: 160,
                      child: SizedBox(
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FlatButton(
                            onPressed: () {
                              this._bloc.add(InitialPokemon(text: searchController.text));
                              if (searchController.text == state.pokemon.name) {
                                Card(
                                  elevation: 2.0,
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Container(
                                    child: ListTile(
                                      title: Text(state.pokemon.name.toString()),
                                      subtitle: Text(state.pokemon.baseExperience.toString()),
                                      leading: CircleAvatar(child: Text(state.pokemon.id.toString())),
                                    ),
                                  ),
                                );
                              } else {
                                print("NOT FOUND");
                              }
                            },
                            color: Colors.blue,
                            child: Text(
                              "Найти",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
