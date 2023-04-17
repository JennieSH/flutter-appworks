import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/product/product_variant.dart';
import 'package:skeletons/skeletons.dart';
import 'product_information.dart';

class ProductMobileLayout extends StatelessWidget {
  Product product;

  ProductMobileLayout({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 32,
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: product.mainImage,
              width: double.infinity,
              placeholder: (context, url) => const SkeletonAvatar(
                style: SkeletonAvatarStyle(height: 600),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 24,
            ),
            ProductVariant(product: product),
            const SizedBox(
              height: 24,
            ),
            ProductInformation(
              story: product.story,
              images: product.images,
            )
          ],
        ),
      ),
    );
  }
}
