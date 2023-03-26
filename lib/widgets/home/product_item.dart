import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.network(
              'https://images.unsplash.com/photo-1543872084-c7bd3822856f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'UNIQLO 特級極輕羽絨外套',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'NT\$ 323',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
