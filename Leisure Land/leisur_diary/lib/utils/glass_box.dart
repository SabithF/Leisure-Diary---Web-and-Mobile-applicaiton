// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final child;
  final double radius;
  const GlassBox({super.key, required this.child, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        // height: MediaQuery.of(context).size.height / 10,
        // padding: const EdgeInsets.symmetric( horizontal:25, vertical: 17),
        child: BackdropFilter(
          blendMode: BlendMode.src,
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
