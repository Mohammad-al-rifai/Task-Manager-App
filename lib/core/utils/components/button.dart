import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../resources/color_manager.dart';
import 'loading.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.function,
    required this.text,
    this.width,
    this.height = 45.0,
    this.background = ColorManager.primary,
    this.isUpperCase = true,
    this.isLoading = false,
    this.isEnable = true,
  });

  Function function;
  String text;
  double? width;
  double? height;
  Color? background;
  bool? isUpperCase;
  bool isLoading;
  bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Conditional.single(
        context: context,
        conditionBuilder: (BuildContext context) => !isLoading,
        widgetBuilder: (BuildContext context) {
          return SizedBox(
            width: width ?? double.infinity,
            height: height,
            child: ElevatedButton(
              onPressed: () => isEnable ? function() : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: background,
              ),
              child: Text(
                isUpperCase! ? text.toUpperCase() : text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        },
        fallbackBuilder: (BuildContext context) {
          return const DefaultLoading();
        },
      ),
    );
  }
}
