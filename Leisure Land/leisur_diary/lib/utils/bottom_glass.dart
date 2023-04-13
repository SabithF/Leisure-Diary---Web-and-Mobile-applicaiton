// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';

class BottomGlassBox extends StatelessWidget {
  final child;
  const BottomGlassBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
        // bottomLeft: Radius.circular(50),
        // bottomRight: Radius.circular(50),
      ),
      child: Container(
        color: Colors.white70,
        height: MediaQuery.of(context).size.height / 9,
        padding: const EdgeInsets.all(5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
