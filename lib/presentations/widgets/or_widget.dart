import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components/my_divider.dart';
import '../../core/utils/functions/functions.dart';
import '../../core/utils/resources/color_manager.dart';
import '../../core/utils/resources/strings_manager.dart';
import '../../core/utils/resources/styles_manager.dart';
import '../../core/utils/resources/values_manager.dart';


class ORWidget extends StatefulWidget {
  const ORWidget({super.key});

  @override
  State<ORWidget> createState() => _ORWidgetState();
}

class _ORWidgetState extends State<ORWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 2100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyDivider(width: getScreenWidth(context) / 4),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: Text(
              AppStrings.or,
              style: getBoldStyle(color: ColorManager.primary),
            ),
          ),
          MyDivider(width: getScreenWidth(context) / 4),
        ],
      ),
    );
  }
}
