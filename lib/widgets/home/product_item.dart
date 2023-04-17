import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletons/skeletons.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.product,
          params: {'id': product.id.toString()},
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              // 解決圖片左邊會溢出 container padding 問題
              // TODO: 尋找是否有更佳解，e.g. container overflow: hidden
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: product.mainImage,
                width: 60,
                height: 80,
                placeholder: (context, url) => const SkeletonAvatar(
                  style: SkeletonAvatarStyle(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                const SizedBox(
                  height: 8,
                ),
                Text('NT\$ ${product.price}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
