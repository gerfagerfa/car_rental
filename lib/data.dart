import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Deal {

  String brand;
  String model;
  double price;
  String condition;
  List<String> images;
  bool favorite;


  Deal(this.brand, this.model, this.price, this.condition, this.images, this.favorite);

}

List<Deal> getDealList(){
  return <Deal>[
    Deal(
      "Honda",
      "Civic Type R 2019",
      2580,
      "Weekly",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
      false
    ),
    Deal(
      "Alfa Romeo",
      "C4",
      3580,
      "Monthly",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
      false
    ),
    Deal(
      "Nissan",
      "GTR",
      1100,
      "Daily",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
      false
    ),
  ];
}

class Dealer {

  String name;
  int offers;
  String image;


  Dealer(this.name, this.offers, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}