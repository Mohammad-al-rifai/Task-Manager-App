import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'pop_widget.dart';

import '../resources/color_manager.dart';

class FullScreenPicture extends StatelessWidget {
  const FullScreenPicture({
    super.key,
    required this.imageUrl,
    this.fromAssets = false,
    this.fromInternet = false,
  });

  final String imageUrl;
  final bool fromAssets;
  final bool fromInternet;

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? imageProvider;

    if (fromAssets) {
      imageProvider = AssetImage(imageUrl);
    } else {
      imageProvider = CachedNetworkImageProvider(imageUrl);
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Hero(
              tag: imageUrl,
              child: PhotoView(
                backgroundDecoration: const BoxDecoration(
                  color: ColorManager.white,
                ),
                imageProvider: imageProvider,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
            const PopWidget(),
          ],
        ),
      ),
    );
  }
}
