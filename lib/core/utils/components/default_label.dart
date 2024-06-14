import 'text_button.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'my_text.dart';

class DefaultLabel extends StatefulWidget {
  const DefaultLabel({
    super.key,
    required this.text,
    this.showAllFunction,
  });

  final String text;
  final Function? showAllFunction;

  @override
  State<DefaultLabel> createState() => _DefaultLabelState();
}

class _DefaultLabelState extends State<DefaultLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p4,
        vertical: AppPadding.p4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            text: widget.text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          widget.showAllFunction != null
              ? DTextButton(
                  text: AppStrings.showAll,
                  function: () {
                    if (widget.showAllFunction != null) {
                      widget.showAllFunction!();
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
