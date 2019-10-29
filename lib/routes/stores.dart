import 'dart:convert';

import 'package:cflp/models/Store.dart';
import 'package:cflp/widgets/storeCard.dart';
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

    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stores.length,
        itemBuilder: (BuildContext context, int index) {
          return StoreCard(store: stores[index]);
        },
      ),
    );
  }
}
