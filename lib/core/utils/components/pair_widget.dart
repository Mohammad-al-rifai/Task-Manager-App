import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'my_text.dart';

class PairWidget extends StatelessWidget {
  const PairWidget({
    super.key,
    required this.label,
    required this.value,
    this.withDivider = true,
    this.notTR = false,
    this.valueColor,
    this.isPrice = false,
    this.valueFontSize,
  });

  final String? label;
  final String? value;
  final bool withDivider;
  final bool notTR;
  final bool isPrice;
  final Color? valueColor;
  final double? valueFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: MText(
              text: label ?? '',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          (withDivider)
              ? Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: AppMargin.m4,
                    end: AppMargin.m8,
                  ),
                  width: 2.0,
                  height: 14.0,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadiusDirectional.circular(AppSize.s4),
                  ),
                )
              : const SizedBox(),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: MText(
                    text: value ?? '',
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge,
                    notTR: notTR,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
