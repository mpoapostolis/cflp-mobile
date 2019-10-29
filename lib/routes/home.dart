import 'package:cflp/routes/favorite.dart';
import 'package:cflp/routes/settings.dart';
import 'package:cflp/routes/stores.dart';
import 'package:cflp/widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeTab = 0;
  final tabViews = [
    Store(),
    Favorite(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: MyAppBar(title: 'home'),
        body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(84, 95, 116, 1)),
            child: tabViews[activeTab]),
        bottomNavigationBar: Container(
          height: 55.0,
          child: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
            currentIndex: activeTab,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
