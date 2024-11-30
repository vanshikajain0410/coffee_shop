import 'package:coffee_shop/pages/order_confirmation.dart';
import 'package:coffee_shop/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffeetile.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Handle "pay now" functionality
  void payNow() {
    // Navigate to the order confirmation page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        // Calculate the total price
        double totalPrice = 0;
        for (var item in value.userCart) {
          Coffee coffee = item.keys.first;
          int quantity = item[coffee]!;
          double price = double.parse(coffee.price.split(" ")[0]);
          totalPrice += price * quantity;
        }

        // Add 5% GST
        double gst = totalPrice * 0.05;
        double finalPrice = totalPrice + gst;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: value.userCart.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // Extract the coffee item and its quantity
                            Coffee coffee = value.userCart[index].keys.first;
                            int quantity = value.userCart[index][coffee]!;

                            return Coffeetile(
                              coffee: coffee,
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: const Color.fromARGB(
                                            255, 173, 48, 39)),
                                    onPressed: () {
                                      value.decreaseQuantity(coffee);
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.keyboard_arrow_up,
                                        color: const Color.fromARGB(
                                            255, 67, 148, 70)),
                                    onPressed: () {
                                      value.addItemtocart(coffee);
                                    },
                                  ),
                                ],
                              ),
                              onPressed: () {
                                value.deleteItemFromCart(coffee);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${coffee.name} removed!"),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
                // Display the total price with GST
                if (value.userCart.isNotEmpty)
                  Column(
                    children: [
                      const Divider(thickness: 1),
                      Text(
                        "Total Price: ₹${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "GST (5%): ₹${gst.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Final Price: ₹${finalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: payNow,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
