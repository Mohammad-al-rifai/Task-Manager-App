import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/components/default_image.dart';
import '../../../core/utils/components/default_label.dart';
import '../../../core/utils/components/my_text.dart';
import '../../../core/utils/components/pair_widget.dart';
import '../../../core/utils/constants/constants_manager.dart';
import '../../../core/utils/functions/functions.dart';
import '../../../core/utils/resources/assets_manager.dart';
import '../../../core/utils/resources/color_manager.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../core/utils/resources/values_manager.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: MText(
        text: AppStrings.settings,
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p8
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: getScreenHeight(context) / 4,
                  width: getScreenHeight(context),
                  decoration: getDeco(
                    context: context,
                    borderSize: AppSize.s8,
                    color: ColorManager.white,
                    withShadow: true,
                  ),
                  child: const DefaultImage(
                    imageUrl: ImageAssets.splashLogo,
                    fromAssets: true,
                    clickable: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0.0, 50.0),
                  child: CircleAvatar(
                    radius: AppSize.s70,
                    backgroundImage: CachedNetworkImageProvider(
                      Constants.image,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s50),
            MText(
              text: Constants.fullName,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: AppSize.s8),
            const DefaultLabel(
              text: AppStrings.personalInfo,
            ),
            Container(
              padding: const EdgeInsetsDirectional.all(AppPadding.p8),
              decoration: getDeco(
                context: context,
                withShadow: true,
                shadowColor: ColorManager.lightPrimary,
                borderSize: AppSize.s8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PairWidget(
                    label: AppStrings.email,
                    value: Constants.email,
                  ),
                  PairWidget(
                    label: AppStrings.userName,
                    value: Constants.username,
                  ),
                  PairWidget(
                    label: AppStrings.gender,
                    value: Constants.gender,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
