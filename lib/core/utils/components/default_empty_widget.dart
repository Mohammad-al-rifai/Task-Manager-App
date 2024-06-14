import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';

class DefaultEmpty extends StatelessWidget {
  const DefaultEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(JsonAssets.empty));
  }
}
