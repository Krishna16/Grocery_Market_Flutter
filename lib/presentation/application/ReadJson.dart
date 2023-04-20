import 'package:flutter/services.dart';
import 'dart:convert';

import 'domain/SupermarketAisle.dart';

class ReadJson{
  late String fileUrl;
  late List<SupermarketAisle> items = [];

  ReadJson(){
    this.fileUrl = "assets/aisles.json";
  }

  Future<void> readJson() async{
    //print ("Inside readJson");

    final String temp = await rootBundle.loadString(fileUrl);
    final jsonData = await json.decode(temp);

    //items = jsonData["items"];

    for (dynamic item in jsonData["items"]){
      //items.add(SupermarketAisle(name: item["name"], imageUrl: "assets/aisles_images/${item["name"].toString().toLowerCase()}.png", color: item["color"]));
      int value = int.parse(item["color"], radix: 16);
      Color color1 = new Color(value);
      items.add(SupermarketAisle(name: item["name"], imageUrl: "assets/aisles_images/${item["name"].toString().toLowerCase()}.png", color: color1));
      //print ("Color in loop: $color1");
    }

    //print ("After assigning to items in readJson");

    //print (items);

    //return jsonData.map((e) => SupermarketAisle.fromJson(e)).toList();
  }
}