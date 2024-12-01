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
    Coffee(
      name: 'Burrito',
      price: "50 Rs",
      imagepath: "assets/images/burrito.png",
    ),
    Coffee(
      name: 'Ramen',
      price: "60 Rs",
      imagepath: "assets/images/ramen.png",
    ),
    Coffee(
      name: 'Chocolate Bar',
      price: "10 Rs",
      imagepath: "assets/images/chocolate-bar.png",
    ),
    Coffee(
      name: 'Sandwich',
      price: "45 Rs",
      imagepath: "assets/images/sandwich.png",
    ),
  ];

  //usercart
  final List<Map<Coffee, int>> usercart = [];

  //getcoffeelist
  List<Coffee> get coffeeshopt => shop;

  //getusercart
 List<Map<Coffee, int>> get userCart => usercart;

  //add
  void addItemtocart(Coffee coffee) {
    // Check if the item already exists in the cart
    int index = usercart.indexWhere((item) => item.keys.first == coffee);
    if (index != -1) {
      // If exists, increase the quantity
      usercart[index][coffee] = usercart[index][coffee]! + 1;
    } else {
      // If not, add as a new item with quantity 1
      usercart.add({coffee: 1});
    }
    notifyListeners();
  }

  //delete
  void deleteItemFromCart(Coffee coffee) {
    usercart.removeWhere((item) => item.keys.first == coffee);
    notifyListeners();
  }

  // Decrease the quantity of an item
  void decreaseQuantity(Coffee coffee) {
    int index = usercart.indexWhere((item) => item.keys.first == coffee);
    if (index != -1) {
      if (usercart[index][coffee]! > 1) {
        // Decrease the quantity if it's greater than 1
        usercart[index][coffee] = usercart[index][coffee]! - 1;
      } else {
        // Remove the item if quantity is 1
        usercart.removeAt(index);
      }
      notifyListeners();
    }
}
}