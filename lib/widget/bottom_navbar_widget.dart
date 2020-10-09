import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getpokemon_fl/page/pokemon_random_page.dart';
import 'package:getpokemon_fl/page/pokemon_search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  var _listPage = List<Widget>();
  var _controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    _listPage.add(PokemonSearchPage());
    _listPage.add(PokemonRandomPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      screens: _listPage,
      controller: _controller,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style6,
      backgroundColor: Colors.white,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Поиск"),
        activeColor: Colors.blue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.refresh),
        title: ("Случайное"),
        activeColor: Colors.blue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }
}