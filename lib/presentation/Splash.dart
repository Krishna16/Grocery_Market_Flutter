import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_market/presentation/application/domain/SupermarketAisle.dart';
import 'application/ReadJson.dart';
import 'package:firebase_core/firebase_core.dart';
import 'application/ReadFirestoreData.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void getData() async {
    ReadJson readJson = ReadJson();

    await readJson.readJson();

    List categories = readJson.items;

    //print ("In getJsonData");
    //print ("Categories : $categories");

    await Firebase.initializeApp(
      name: "GroceryMarket",
      options: FirebaseOptions(
          apiKey: "AIzaSyABE-BSCB0JOCdPzS1NEhxoE4Z_NNmkFYQ",
          appId: "1:236639587758:android:4771696847c6d54d31cc3f",
          messagingSenderId: "XXX",
          projectId: "grocerymarket-665b3",
          storageBucket: "grocerymarket-665b3.appspot.com"
      ),
    );

    ReadFirestoreData readFirestoreData = ReadFirestoreData();
    await readFirestoreData.readFirestoreData();

    List<SupermarketAisle> usually_bought = readFirestoreData.items;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "categories": categories,
        "usually_bought": usually_bought
      });
    });
  }


  @override
  void initState() {
    //print ("Inside initState of Splash");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 60.0)
        )
    );
  }
}

