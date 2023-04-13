// ignore_for_file: prefer_final_fields, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_app_ui/screens/login-register/Widgets/loginHeader.dart';
import 'package:travel_app_ui/screens/login-register/Widgets/loginWidget.dart';
import 'package:travel_app_ui/screens/login-register/loginScreen.dart';
import 'package:http/http.dart' as http;
import '../../utils/config.dart';
import 'Widgets/registerForm.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  // reg user function
  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      // mapping the body

      var regBody = {
        "username": nameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);
      if (jsonResponse['status']) {
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
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const loginHead(),
                      Form(
                          child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // USERNAME
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  errorStyle:
                                      const TextStyle(color: Colors.red),
                                  errorText: _isNotValidate
                                      ? "Please enter User Name"
                                      : null,
                                  prefixIcon:
                                      const Icon(Icons.person_2_rounded),
                                  labelText: 'User Name',
                                  hintText: 'User Name',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // Email
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(color: Colors.red),
                                    errorText: _isNotValidate
                                        ? "Please enter E-mail"
                                        : null,
                                    prefixIcon:
                                        Icon(Icons.person_outline_outlined),
                                    labelText: 'E-mail',
                                    hintText: 'E-Mail',
                                    border: OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // PASSWORD
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(color: Colors.red),
                                    errorText: _isNotValidate
                                        ? "Please enter password"
                                        : null,
                                    prefixIcon: Icon(Icons.fingerprint),
                                    labelText: 'Password',
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                        onPressed: null,
                                        icon:
                                            Icon(Icons.remove_red_eye_sharp))),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      registerUser();
                                    },
                                    child: Text(
                                      'Signup'.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    },
                                    child: const Text.rich(TextSpan(
                                        text: 'Already have an account? ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: 'Login',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]))),
                              )
                            ],
                          ),
                        ),
                      ))
                    ]))));
  }
}
