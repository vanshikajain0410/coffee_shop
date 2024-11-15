import 'package:coffee_shop/components/coffeetile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removefromcart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).deleteItemtocart(coffee);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Successfully added to cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = value.userCart[index];

                      return Coffeetile(
                        coffee: eachCoffee,
                        onPressed: () => removefromcart(eachCoffee),
                        icon: Icon(Icons.delete),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
