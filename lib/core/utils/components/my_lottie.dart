import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottie extends StatelessWidget {
  const MyLottie({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path);
  }
}
