import 'dart:convert';

import 'package:cflp/models/Store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Store extends StatefulWidget {
  Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    super.initState();
    getStores();
  }

  final String url = 'https://5db478844e41670014ef25d5.mockapi.io/api/stores';
  List<StoreModel> stores;

  Future<String> getStores() async {
    var response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    List<StoreModel> _stores = data.map((json) {
      StoreModel p = StoreModel.fromMappedJson(json);
      return p;
    }).toList();

    setState(() {
      stores = _stores;
    });
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    if (stores == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stores.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.local_cafe, color: Colors.white),
                ),
                title: Text(
                  stores[index].name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Row(
                  children: <Widget>[
                    Text(stores[index].street,
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
                trailing:
                    Icon(Icons.location_on, color: Colors.white, size: 30.0)),
          ),
        );
      },
    );
  }
}
