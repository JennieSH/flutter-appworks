import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:skeletons/skeletons.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({
    super.key,
    required this.product,
  });

  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: product.mainImage,
          height: 150,
          width: 100,
          fit: BoxFit.cover,
          placeholder: (context, url) => const SkeletonAvatar(
            style: SkeletonAvatarStyle(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title),
            const SizedBox(height: 4),
            Text(product.id.toString()),
            const SizedBox(height: 4),
            Text('顏色｜${product.selectedColor.name}'),
            const SizedBox(height: 4),
            Text('尺寸｜${product.selectedSize}')
          ],
        )
      ],
    );
  }
}
