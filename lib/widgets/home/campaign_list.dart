import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:flutter_appworks/models/campaign.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletons/skeletons.dart';

class CampaignList extends StatelessWidget {
  const CampaignList({
    super.key,
    required this.campaigns,
  });

  final List<Campaign> campaigns;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: campaigns.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 20,
          ),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteName.product,
                params: {'id': campaigns[index].productId.toString()},
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
                imageUrl: campaigns[index].picture,
                placeholder: (context, url) => const SkeletonAvatar(
                  style: SkeletonAvatarStyle(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
