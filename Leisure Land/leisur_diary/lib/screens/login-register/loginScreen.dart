// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app_ui/screens/login-register/signUp.dart';
import 'package:travel_app_ui/utils/consts/imageStrings.dart';

import 'Widgets/loginHeader.dart';
import 'Widgets/loginWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loginHead(),
            LoginForm(
                // emailController: emailController,
                // passwordController: passwordController
                ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: Text.rich(TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: const [
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ])))
          ],
        ),
      ),
    );
  }
}
