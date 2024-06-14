import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';

class DefaultError extends StatelessWidget {
  const DefaultError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(JsonAssets.error));
  }
}
