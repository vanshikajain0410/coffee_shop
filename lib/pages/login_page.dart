import 'package:coffee_shop/components/my_text_field.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:coffee_shop/ui.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 60,),
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

                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                // password textfield

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                // forgot pass

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

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
                ),
                const SizedBox(
                  height: 30,
                ),

                // New user registration
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
