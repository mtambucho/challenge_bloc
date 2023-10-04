import 'package:flutter/material.dart';

enum LoadingBoxWidthSize { xSmall, small, normal, long, infinite }

enum LoadingBoxHeightSize { small, normal, long }

class LoadingBox extends StatelessWidget {
  const LoadingBox({
    super.key,
    this.width = LoadingBoxWidthSize.normal,
    this.height = LoadingBoxHeightSize.normal,
  });
  final LoadingBoxWidthSize width;
  final LoadingBoxHeightSize height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: getHeightSize,
        color: Colors.grey,
        width: getWidthSize,
      ),
    );
  }

  double get getWidthSize => switch (width) {
        LoadingBoxWidthSize.xSmall => 50,
        LoadingBoxWidthSize.small => 80,
        LoadingBoxWidthSize.normal => 100,
        LoadingBoxWidthSize.long => 200,
        LoadingBoxWidthSize.infinite => double.infinity,
      };

  double get getHeightSize => switch (height) {
        LoadingBoxHeightSize.small => 10,
        LoadingBoxHeightSize.normal => 20,
        LoadingBoxHeightSize.long => 40,
      };
}
