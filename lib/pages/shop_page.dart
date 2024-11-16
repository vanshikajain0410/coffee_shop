import 'package:coffee_shop/components/coffeetile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShoppageState();
}

class _ShoppageState extends State<ShopPage> {
  void addtocart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemtocart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text("What would you like to order?",
                  style: TextStyle(fontSize: 17)),
              const SizedBox(height: 25),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeshopt.length,
                      itemBuilder: (context, index) {
                        //get individual coffee
                        Coffee eachCoffee = value.coffeeshopt[index];
                        //return the tile for this coffee
                        return Coffeetile(
                            coffee: eachCoffee,
                            icon: Icon(Icons.add),
                            onPressed: () => addtocart(eachCoffee));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
