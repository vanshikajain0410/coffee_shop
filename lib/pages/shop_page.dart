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
  void confirmAddToCart(Coffee coffee) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add to Cart"),
        content: Text("Do you want to add ${coffee.name} to the cart?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the confirmation dialog
              // Add the item to the cart
              Provider.of<CoffeeShop>(context, listen: false)
                  .addItemtocart(coffee);
              // Show success dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Center(
                    child: Text(
                      "Successfully added to cart",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              );
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text(
                  "What are you craving?",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeshopt.length,
                    itemBuilder: (context, index) {
                      // Get individual coffee
                      Coffee eachCoffee = value.coffeeshopt[index];
                      // Return the tile for this coffee
                      return Coffeetile(
                        coffee: eachCoffee,
                        icon: const Icon(Icons.add),
                        onPressed: () => confirmAddToCart(eachCoffee),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
