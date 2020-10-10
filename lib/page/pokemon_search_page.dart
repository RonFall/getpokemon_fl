import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/bloc/pokemon_bloc.dart';
import 'package:getpokemon_fl/widget/retry_widget.dart';

import '../utils.dart';

class PokemonSearchPage extends StatefulWidget {
  @override
  _PokemonSearchPageState createState() => _PokemonSearchPageState();
}

class _PokemonSearchPageState extends State<PokemonSearchPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  _loadPokemon() async {
    context.bloc<PokemonBloc>().add(InitialPokemon(text: searchController.text));
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
            child: ListView(
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Имя покемона...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                  controller: searchController,
                ),
                BlocBuilder<PokemonBloc, PokemonState>(
                    builder: (context, state) {
                  if (state is PokemonError) {
                    return Retry(
                      message: "Неверный формат имени покемона!",
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
                    return onRequestPokemon(name, image);
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
                        _loadPokemon();
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

  // basePokemon() => Container(
  //       child: Column(
  //         children: [
  //           Image(
  //             width: 200,
  //             height: 160,
  //             image: AssetImage("assets/images/unknow_pokemon.png"),
  //             fit: BoxFit.cover,
  //           ),
  //           Container(
  //             margin: const EdgeInsets.only(top: 5),
  //             child: Text(
  //               "Неизвестный покемон",
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  onRequestPokemon(String name, String image) => Container(
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
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}
