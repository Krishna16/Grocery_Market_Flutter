import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_images/carousel_images.dart';
import 'application/domain/SupermarketAisle.dart';
import 'package:image_card/image_card.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Widget setAppBarLeadingIcon() {
  return Container(
    margin: EdgeInsets.fromLTRB(25, 10, 0, 10),
    child: Image.asset("assets/grocery_icon.png"),
  );
}

class _HomeState extends State<Home> {
  final List<String> carouselImages = [
    "assets/coffee_carousel.jpg",
    "assets/oranges_carousel.jpg",
    "assets/watermelon_carousel.jpg",
    "assets/tomato_carousel.jpg",
  ];

  final List<IconData> bottomNavigationBarIconList = [
    Icons.home,
    Icons.category_outlined,
    Icons.food_bank_rounded,
    Icons.person
  ];

  Map temp = {};
  late List<SupermarketAisle> categories;
  late List<SupermarketAisle> usually_bought;

  @override
  Widget build(BuildContext context) {
    temp = ModalRoute.of(context)!.settings.arguments as Map;
    categories = temp["categories"];
    usually_bought = temp["usually_bought"];

    //print("Categories in home: $categories");

    //print ("OtherColor: ${categories[0].color}");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 12,
        leading: setAppBarLeadingIcon(),
        title: Text(
          "GroceryMarket",
          style: TextStyle(color: Color(0xFF434a55), fontSize: 16),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Color(0xFF434a55),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Color(0xFF6b78de),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomNavigationBarIconList,
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => {},
        //other params
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            CarouselImages(
              listImages: carouselImages,
              height: 210,
              scaleFactor: 0.7,
              borderRadius: 30,
              verticalAlignment: Alignment.center,
            ),

            SizedBox(
              height: 32,
            ),

            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(color: Color(0xFF434a55), fontSize: 28),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.chevron_right,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),

            /*Row(children: <Widget>[
              Expanded(
                child: Flexible(
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          /*return TransparentImageCard(
                          width: 150,
                          imageProvider: AssetImage(categories[index].imageUrl),
                          title: Text(
                            categories[index].name,
                            style: TextStyle(
                                color: Color(0xFF434a55),
                                fontSize: 32
                            ),
                          ),
                        );*/

                          return Card(
                            child: ListTile(
                              title: Text(
                                categories[index].name,
                                style:
                                    TextStyle(color: Color(0xFF434a55), fontSize: 24),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "images/${categories[index].imageUrl}"),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ])*/

            /*Container(
              height: 170,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: TransparentImageCard(
                      width: 200,
                      imageProvider: AssetImage(
                        categories[index].imageUrl,
                      ),
                      title: Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            //color: Color(0xFF434a55),
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            )*/

            Container(
              height: 180,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: categories[index].color,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      categories[index].imageUrl,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      categories[index].name,
                                      style: TextStyle(
                                          color: Color(0xFF434a55),
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ]
                            ),
                          ),

                          SizedBox(height: 20,)
                        ],
                      ),
                    );
                  }
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Usually Buy",
                    style: TextStyle(color: Color(0xFF434a55), fontSize: 28),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.chevron_right,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              height: 170,
              child: ListView.builder(
                  itemCount: usually_bought.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: categories[index].color,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.network(
                                      usually_bought[index].imageUrl,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      usually_bought[index].name,
                                      style: TextStyle(
                                          color: Color(0xFF434a55),
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "${usually_bought[index].weight} kg",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
