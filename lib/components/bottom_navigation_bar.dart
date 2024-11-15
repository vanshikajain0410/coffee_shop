import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class Bottomnavigationbar extends StatelessWidget {
  void Function(int)? onTabchange;
  Bottomnavigationbar({
    super.key,
    required this.onTabchange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabchange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[800],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white60),
        tabs: [
          GButton(
            icon: Icons.home_max_outlined,
            text: 'shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'cart',
          )
        ],
      ),
    );
  }
}
