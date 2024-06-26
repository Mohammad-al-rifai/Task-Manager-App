import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({
    super.key,
    this.xT = 0.0,
    this.yT = 0.0,
    this.size,
    this.basic = true,
    this.isCenter = true,
  });

  final double xT;
  final double yT;
  final double? size;
  final bool basic;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return basic
        ? getChild()
        : SizedBox(
            child: Center(
              child: Transform.translate(
                offset: Offset(xT, yT),
                child: Lottie.asset(
                  JsonAssets.loading,
                  fit: BoxFit.fitWidth,
                  width: size ?? 50.0,
                  height: size ?? 50.0,
                ),
              ),
            ),
          );
  }

  Widget getChild() {
    return isCenter
        ? const SizedBox(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : const CupertinoActivityIndicator();
  }
}
