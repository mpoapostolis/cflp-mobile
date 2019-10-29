import 'package:cflp/routes/details.dart';
import 'package:cflp/routes/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "cflp",
        theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => Home(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => Details(),
        });
  }
}
