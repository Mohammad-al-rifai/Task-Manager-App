import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../constants/urls.dart';
import '../functions/functions.dart';
import '../resources/assets_manager.dart';
import 'full_screen_picture.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.clickable = false,
    this.width,
    this.height,
    this.fromAssets = false,
    this.fromInternet = false,
  });

  final String? imageUrl;
  final BoxFit? fit;
  final bool clickable;
  final double? width;
  final double? height;
  final bool fromAssets;
  final bool fromInternet;

  @override
  Widget build(BuildContext context) {
    if (clickable) {
      return Hero(
        tag: fromAssets ? (imageUrl ?? '') : (Urls.filesUrl + (imageUrl ?? '')),
        child: GestureDetector(
          onTap: () {
            navigateTo(
              context,
              FullScreenPicture(
                imageUrl: (fromInternet || fromAssets)
                    ? (imageUrl ?? '')
                    : (Urls.filesUrl + (imageUrl ?? '')),
                fromAssets: fromAssets,
                fromInternet: fromInternet,
              ),
            );
          },
          child: fromInternet
              ? imageFromInternet()
              : (fromAssets ? assetImage() : image()),
        ),
      );
    } else {
      return fromAssets ? assetImage() : image();
    }
  }

  Widget image() => CachedNetworkImage(
        imageUrl: Urls.filesUrl + (imageUrl ?? ''),
        fit: fit,
        width: width ?? double.infinity,
        height: height,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: SizedBox(
            child: Image.asset(ImageAssets.noImage),
          ),
        ),
      );

  Widget imageFromInternet() => CachedNetworkImage(
        imageUrl: (imageUrl ?? ''),
        fit: fit,
        width: width ?? double.infinity,
        height: height,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: SizedBox(
            child: Image.asset(ImageAssets.noImage),
          ),
        ),
      );

  Widget assetImage() {
    return Image(
      image: AssetImage(imageUrl ?? ''),
      fit: fit,
      width: width ?? double.infinity,
      height: height,
    );
  }
}
