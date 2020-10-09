import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getpokemon_fl/bloc/pokemon_bloc.dart';
import 'package:getpokemon_fl/page/pokemon_search_page.dart';
import 'package:getpokemon_fl/widget/bottom_navbar_widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (context) => PokemonBloc()..add(InitialPokemon()),
        ),
      ],
      child: MaterialApp(
        title: 'GetPokemon',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => PokemonSearchPage(), settings: routeSettings);
            default:
              return MaterialPageRoute(
                  builder: (context) => PokemonSearchPage(), settings: routeSettings);
              break;
          }
        },
        home: BottomNavBar(),
      ),
    );
  }
}
