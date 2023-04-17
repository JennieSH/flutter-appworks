import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/key_vision.dart';
import 'package:skeletons/skeletons.dart';

class KeyVisionList extends StatelessWidget {
  const KeyVisionList({
    super.key,
    required this.kvList,
  });

  final List<KeyVision> kvList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kvList.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 20,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              width: 350,
              imageUrl: kvList[index].picture,
              placeholder: (context, url) => const SkeletonAvatar(
                style: SkeletonAvatarStyle(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
