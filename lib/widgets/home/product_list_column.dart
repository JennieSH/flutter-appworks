import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/product_item.dart';

class ProductListColumn extends StatefulWidget {
  const ProductListColumn({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  State<ProductListColumn> createState() => _ProductListColumnState();
}

class _ProductListColumnState extends State<ProductListColumn> {
  @override
  Widget build(BuildContext context) {
    // 預設列表第一個展開
    final List<bool> _isExpanded = [
      true,
      ...List.filled(widget.categories.length - 1, false)
    ];

    return ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) => ExpansionTile(
        textColor: Colors.black, // 展開 title color
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.categories[index].name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded[index] = expanded;
          });
        },
        initiallyExpanded: _isExpanded[index],
        children: widget.categories[index].products
            .map(
              (product) => ProductItem(
                product: product,
              ),
            )
            .toList(),
      ),
    );
  }
}
