import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class SupermarketAisle{
  late String name;
  late String imageUrl;
  Color? color;
  late num weight;

  //SupermarketAisle({required this.name, required this.imageUrl, required this.color});
  SupermarketAisle({required this.name, required this.imageUrl, required this.color});
  SupermarketAisle.item({required this.name, required this.imageUrl, required this.weight});

  factory SupermarketAisle.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    final data = documentSnapshot.data();
    return SupermarketAisle.item(name: data!["name"], imageUrl: data["imageUrl"], weight: data["weight"]);
  }
}