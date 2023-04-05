import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/utils/color.dart';

class ProductVariant extends StatefulWidget {
  Product product;

  ProductVariant({
    super.key,
    required this.product,
  });

  @override
  State<ProductVariant> createState() => _ProductVariantState();
}

class _ProductVariantState extends State<ProductVariant> {
  late String currentColorCode = '';
  late String currentSize = '';
  late int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.title,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${widget.product.id}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'TWD. ${widget.product.price}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          height: 32,
          thickness: 1,
          color: Colors.grey[300],
        ),
        Row(
          children: [
            const Text('顏色'),
            // Q: color doesn't work
            // const VerticalDivider(
            //   width: 32,
            //   thickness: 300,
            //   color: Colors.red,
            // ),
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.grey[300],
            ),
            Expanded(
              child: Wrap(
                spacing: 24, // 水平 gap
                runSpacing: 12, // 垂直 gap
                children: widget.product.colors
                    .map(
                      (color) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColorCode = currentColorCode == color.code
                                ? ''
                                : color.code;
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: color.code == currentColorCode
                                  ? Colors.black54
                                  : Colors.transparent,
                              width: 2,
                            ),
                            color: hexToColor('#${color.code}'),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            const Text('尺寸'),
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.grey[300],
            ),
            Expanded(
              child: Wrap(
                spacing: 24, // 水平 gap
                runSpacing: 12, // 垂直 gap
                children: widget.product.sizes
                    .map(
                      (size) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSize = currentSize == size ? '' : size;
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: currentSize == size
                                ? Colors.grey[800]
                                : Colors.grey[200],
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: currentSize == size
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            const Text('數量'),
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.grey[300],
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    onPressed: amount <= 1
                        ? null
                        : () {
                            setState(
                              () {
                                amount -= 1;
                              },
                            );
                          },
                    iconSize: 36,
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        amount.toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          amount += 1;
                        },
                      );
                    },
                    iconSize: 36,
                    icon: const Icon(Icons.add_circle),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[800],
            minimumSize: const Size.fromHeight(60),
            disabledBackgroundColor: Theme.of(context)
                .primaryColor
                .withOpacity(.3), // Background Color
            disabledForegroundColor: Colors.grey[400], // Text Color
          ),
          child: const Text(
            '加入購物車',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          widget.product.note,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          widget.product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          widget.product.description,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          widget.product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          '加工產地/${widget.product.place}',
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
