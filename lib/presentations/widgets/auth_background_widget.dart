import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components/my_text.dart';
import '../../core/utils/resources/assets_manager.dart';
import '../../core/utils/resources/color_manager.dart';
import '../../core/utils/resources/styles_manager.dart';
import '../../core/utils/resources/values_manager.dart';

class AuthBackGroundWidget extends StatefulWidget {
  const AuthBackGroundWidget({required this.title, super.key});

  final String title;

  @override
  State<AuthBackGroundWidget> createState() => _AuthBackGroundWidgetState();
}

class _AuthBackGroundWidgetState extends State<AuthBackGroundWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeInUp(
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.light1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.light2),
                    ),
                  ),
                )),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.clock),
                    ),
                  ),
                )),
          ),
          Positioned(
            child: FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: MText(
                    text: widget.title,
                    maxLines: 2,
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: AppSize.s30,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
