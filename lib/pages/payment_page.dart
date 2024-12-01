import 'dart:math';

import 'package:coffee_shop/pages/order_confirmation.dart';
import 'package:coffee_shop/pages/shop_page.dart';
import 'package:coffee_shop/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void navigateToConfirmationPage(String paymentMethod) {
    final randomOrderNumber = Random().nextInt(900) + 100;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          paymentMethod: paymentMethod,
          orderNumber: randomOrderNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Credit card widget
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
              ),
              const SizedBox(height: 100),
              // "Pay Now" Button
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    navigateToConfirmationPage("Pay Now");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please complete the payment details."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(172, 23, 90, 145),
                ),
                child: const Text("Pay Now", style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 10),
              // "OR" Text
              const Text(
                "OR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              // "Pay at the Counter" Button
              ElevatedButton(
                onPressed: () {
                  navigateToConfirmationPage("Pay at the Counter");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(123, 95, 52, 52),
                ),
                child: const Text("Pay at the Counter",style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

