import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/dimensions.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/product/product_variant.dart';
import 'product_information.dart';
import 'package:skeletons/skeletons.dart';

class ProductDesktopLayout extends StatelessWidget {
  Product product;

  ProductDesktopLayout({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(
            // https://www.fluttercampus.com/guide/60/how-to-set-minimum-and-maximum-height-or-width-of-widget-flutter/
            // set maximum width
            maxWidth: containerMaxWidth,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: containerMaxWidth / 1.7,
                      imageUrl: product.mainImage,
                      placeholder: (context, url) => const SkeletonAvatar(
                        style: SkeletonAvatarStyle(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(child: ProductVariant(product: product))
                ],
              ),
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
      ),
    );
  }
}
