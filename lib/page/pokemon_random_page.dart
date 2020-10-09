import 'package:flutter/material.dart';

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
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Container())),
        ],
      ),
    );
  }
}
