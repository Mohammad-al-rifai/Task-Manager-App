import 'package:flutter/material.dart';

import '../../utils/functions/functions.dart';
import '../../utils/resources/color_manager.dart';
import '../../utils/resources/values_manager.dart';

class PopWidget extends StatelessWidget {
  const PopWidget({
    super.key,
    this.withBackground = true,
  });

  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: withBackground
          ? Container(
              margin: const EdgeInsetsDirectional.all(AppMargin.m4),
              height: 40.0,
              width: 25.0,
              decoration: getDeco(
                context: context,
                withShadow: true,
                borderSize: AppSize.s8,
              ),
              child: buildPopWidget(),
            )
          : buildPopWidget(),
    );
  }

  Widget buildPopWidget() {
    return Center(
      child: Icon(
        Icons.arrow_back_ios_new,
        color: ColorManager.primary,
        size: AppSize.s25,
      ),
    );
  }
}
