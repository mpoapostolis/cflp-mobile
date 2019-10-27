import 'package:flutter/material.dart';
import './routes/stores.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(58, 66, 86, 1.0);
    return MaterialApp(
      title: "cflp",
      theme: new ThemeData(primaryColor: color),
      home: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: color,
          title: Text('cflp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],
        ),
        body: Store(),
        bottomNavigationBar: Container(
          height: 55.0,
          child: BottomAppBar(
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
