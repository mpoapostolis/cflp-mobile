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

  void changeView(int index) {
    setState(() {
      activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    void bottomTapped(int index) {
      setState(() {
        activeTab = index;
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      });
    }

    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: MyAppBar(title: 'home'),
        body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(84, 95, 116, 1)),
            child: PageView(
                controller: pageController,
                onPageChanged: (e) {
                  changeView(e);
                },
                children: [
                  Store(),
                  Favorite(),
                  Settings(),
                ])),
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
            onTap: bottomTapped,
          ),
        ),
      ),
    );
  }
}
