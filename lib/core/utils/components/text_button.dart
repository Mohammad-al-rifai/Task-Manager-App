import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import 'loading.dart';
import 'my_text.dart';

class DTextButton extends StatelessWidget {
  DTextButton({
    super.key,
    required this.text,
    required this.function,
    this.isUpperCase = false,
    this.isLoading = false,
    this.style,
  });

  Function function;
  bool isUpperCase;
  String text;
  TextStyle? style;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => !isLoading,
      widgetBuilder: (BuildContext context) {
        return TextButton(
          onPressed: () => function(),
          child: MText(
            text: isUpperCase ? text.toUpperCase() : text,
            style: style ??
                getMediumStyle(
                  color: ColorManager.primary,
                ),
          ),
        );
      },
      fallbackBuilder: (BuildContext context) {
        return const DefaultLoading(
          isCenter: false
        );
      },
    );
  }
}
