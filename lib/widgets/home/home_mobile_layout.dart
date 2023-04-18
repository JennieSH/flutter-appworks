import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/campaign.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/home/campaign_list.dart';
import 'package:flutter_appworks/widgets/home/product_list_column.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout(
      {super.key, required this.campaigns, required this.categories});

  final List<Campaign> campaigns;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampaignList(campaigns: campaigns),
        Expanded(
          child: ProductListColumn(categories: categories),
        )
      ],
    );
  }
}
