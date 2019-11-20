import 'package:flutter/material.dart';

class FrameImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit fit;

  FrameImage(this.url, {this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
      frameBuilder: (BuildContext context, Widget child, int frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          duration: Duration(seconds: 1),
          child: child,
          opacity: frame == null ? 0 : 1,
          curve: Curves.easeOut,
        );
      },
    );
  }
}
