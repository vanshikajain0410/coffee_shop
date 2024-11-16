import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

// import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //Coffeelist
  final List<Coffee> shop = [
    Coffee(
      name: 'Iced Latte',
      price: "70 Rs",
      imagepath: "assets/images/iced-latte.png",
    ),
    Coffee(
      name: 'Caramel Latte',
      price: "70 Rs",
      imagepath: "assets/images/latte.png",
    ),
    Coffee(
      name: 'Cappuccino',
      price: "45 Rs",
      imagepath: "assets/images/cappuccino.png",
    ),
    Coffee(
      name: 'Espresso',
      price: "70 Rs",
      imagepath: "assets/images/espresso.png",
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
