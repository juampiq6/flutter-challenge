import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final String errorAssetImagePath;
  final double height;
  final double width;
  final int heightCache;
  final int widthCache;
  final BoxFit fit;
  CustomNetworkImage({this.url, this.errorAssetImagePath, this.height, this.width, this.heightCache, this.widthCache, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: url,
            fit: fit,
            errorWidget: (_, str, dyn) => Image.asset(
              errorAssetImagePath ?? "assets/images/generic_crypto.png",
              fit: fit,
            ),
            memCacheHeight: heightCache,
            memCacheWidth: widthCache,
            // progressIndicatorBuilder: (_, __, ___) =>
            //     Center(),
          )
        : Image.asset(errorAssetImagePath ?? "assets/images/generic_crypto.png", fit: fit);
  }
}