import 'package:coffee_shop/ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              'https://lottie.host/ea1fdd84-0606-44b6-9f0f-074f94be625d/ckSX3ndOhz.json'),
        ],
      )),
    );
  }
}
