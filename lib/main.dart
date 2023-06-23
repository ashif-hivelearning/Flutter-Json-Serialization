import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_test/product_model.dart';

import 'product_item_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, listData) {
          if (listData.hasError) {
            return Center(child: Text("${listData.error}"));
          } else if (listData.hasData) {
            List<ProductModel> items = listData.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ProductItemWidget(
                product: items[index],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // read json data
  Future<List<ProductModel>> readJsonData() async {
    final jsonData = await rootBundle.loadString('raw/product_list.json');
    final mapList = jsonDecode(jsonData) as List<dynamic>;

    return mapList.map((product) => ProductModel.fromJson(product)).toList();
  }
}
