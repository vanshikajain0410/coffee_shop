import 'package:coffee_shop/components/my_text_field.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:coffee_shop/ui.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  // text editing controllers
  final usernameController= TextEditingController();
  final passwordController= TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo coffee shop

              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/coffee-shop-logo.png',
                  height: 200,
                ),
              ),

              // logo nescafe

              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/Nescafe-Logo.png',
                  height: 70,
                  opacity: AlwaysStoppedAnimation(0.7),
                ),
              ),

              // welcome back text

              Text(
                "Have a break? Order something",
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),

              const SizedBox(
                height: 40,
              ),
              // username textfield

              // MyTextField(
              //   controller: usernameController,


              // ),

              const SizedBox(
                height: 10,
              ),

              // password textfield

              // MyTextField(
              //   controller: passwordController,

                
              // ),

              // forgot pass

              // enter shop button

              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.brown[700],
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(25),
                  child: Text(
                    "Enter Shop",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
