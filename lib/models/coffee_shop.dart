import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //Coffeelist
  final List<Coffee> shop = [
    Coffee(
      name: 'Latte',
      price: "70 Rs",
      imagepath: "lib/images/coffee-logo-clipart-lg.png",
    ),
    Coffee(
      name: 'Hazelnut Latte',
      price: "70 Rs",
      imagepath: "lib/images/coffee-logo-clipart-lg.png",
    ),
    Coffee(
      name: 'Cappacunio',
      price: "70 Rs",
      imagepath: "lib/images/Coffee-logo-illustration-on-transparent-background-PNG.png",
    ),
    Coffee(
      name: 'Latte',
      price: "70 Rs",
      imagepath: "lib/images/coffee-logo-clipart-lg.png",
    ),
  ];

  //usercart
  List<Coffee> usercart = [];

  //getcoffeelist
  List<Coffee> get coffeeshopt => shop;

  //getusercart
  List<Coffee> get userCart => usercart;

  //add
  void addItemtocart(Coffee coffee) {
    usercart.add(coffee);
    notifyListeners();
  }

  //delete
  void deleteItemtocart(Coffee coffee) {
    usercart.remove(coffee);
    notifyListeners();
  }
}
