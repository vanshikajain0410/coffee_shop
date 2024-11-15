import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/shop_page.dart';
import 'package:coffee_shop/ui.dart';
import 'package:coffee_shop/main.dart';
import 'package:coffee_shop/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> pages = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Bottomnavigationbar(
        onTabchange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedindex],
    );
  }
}
