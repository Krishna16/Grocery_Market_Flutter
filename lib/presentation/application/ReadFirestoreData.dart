import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_market/presentation/application/domain/SupermarketAisle.dart';

class ReadFirestoreData{
  List<SupermarketAisle> items = [];

  Future<List<SupermarketAisle>> readFirestoreData() async {
    final snapshot = await FirebaseFirestore.instance.collection("usually_by").get();

    print (FirebaseFirestore.instance);

    items = snapshot.docs.map((e) => SupermarketAisle.fromSnapshot(e)).toList();

    print (items);

    return items;
  }
}