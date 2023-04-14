// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_app_ui/screens/login-register/signUp.dart';
import 'package:travel_app_ui/utils/consts/imageStrings.dart';
import 'package:http/http.dart' as http;
import '../../utils/config.dart';
import '../home/homepage.dart';
import 'Widgets/loginHeader.dart';
import 'Widgets/loginWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // mapping the body

      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', 'myToken');

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        print('Something went wrong');
      }
    } else {
      setState(() {
        bool _isNotValidate = true;
      });
    }
  }

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
                emailController: emailController,
                passwordController: passwordController),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
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
