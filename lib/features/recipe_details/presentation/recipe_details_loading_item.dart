import 'package:challenge_bloc/common/widgets/loading_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeDetailsLoadingItem extends StatelessWidget {
  const RecipeDetailsLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade500,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoadingBox(
                      width: LoadingBoxWidthSize.xSmall,
                      height: LoadingBoxHeightSize.small,
                    ),
                    LoadingBox(width: LoadingBoxWidthSize.long),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Center(child: LoadingBox(width: LoadingBoxWidthSize.small)),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade500,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  LoadingBox(),
                  LoadingBox(
                    width: LoadingBoxWidthSize.infinite,
                    height: LoadingBoxHeightSize.long,
                  ),
                  LoadingBox(
                    width: LoadingBoxWidthSize.infinite,
                    height: LoadingBoxHeightSize.long,
                  ),
                  LoadingBox(
                    width: LoadingBoxWidthSize.infinite,
                    height: LoadingBoxHeightSize.long,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LoadingBox(),
                  LoadingBox(
                    width: LoadingBoxWidthSize.infinite,
                    height: LoadingBoxHeightSize.long,
                  ),
                  LoadingBox(
                    width: LoadingBoxWidthSize.infinite,
                    height: LoadingBoxHeightSize.long,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
