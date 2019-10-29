import 'package:cflp/models/Store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;
  StoreCard({@required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.5),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.8)),
          child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.withAlpha(60),
                      child: Icon(
                        Icons.local_cafe,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${(store.meters / 1000).toStringAsFixed(2)} km',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              ),
              title: Text(
                store.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(store.street, style: TextStyle(color: Colors.grey))
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  icon: Icon(Icons.navigate_next,
                      color: Colors.white, size: 30.0))),
        ),
      ),
    );
  }
}
