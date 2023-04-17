import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/dimensions.dart';
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
  String? currentColorCode;
  String? currentSize;
  int currentQuantity = 1;

  bool get isAllSelected {
    return currentColorCode != null && currentSize != null;
  }

  int get getAvailableStock {
    var stock = 0;

    if (isAllSelected) {
      for (var i = 0; i < widget.product.variants.length; i++) {
        var colorCode = widget.product.variants[i].colorCode;
        var size = widget.product.variants[i].size;

        if (currentColorCode == colorCode && currentSize == size) {
          return widget.product.variants[i].stock;
        }
      }
    }

    return stock;
  }

  Set get getAvailableColorCodes {
    Set colorCodes = {};

    if (currentSize != null) {
      for (var i = 0; i < widget.product.variants.length; i++) {
        var colorCode = widget.product.variants[i].colorCode;
        var size = widget.product.variants[i].size;
        var stock = widget.product.variants[i].stock;

        if (currentSize == size && stock != 0) {
          colorCodes.add(colorCode);
        }
      }
    }

    return colorCodes;
  }

  Set get getAvailableSizes {
    Set sizes = {};

    if (currentColorCode != null) {
      for (var i = 0; i < widget.product.variants.length; i++) {
        var colorCode = widget.product.variants[i].colorCode;
        var size = widget.product.variants[i].size;
        var stock = widget.product.variants[i].stock;

        if (currentColorCode == colorCode && stock != 0) {
          sizes.add(size);
        }
      }
    }

    return sizes;
  }

  void selectColorCode(String colorCode) {
    setState(() {
      // 該顏色無庫存，直接 return
      var isAvailable = getAvailableColorCodes.contains(colorCode);
      if (currentSize != null && !isAvailable) return;

      // 更新目前選取顏色，如與當前顏色相同，則取消選取
      currentColorCode = currentColorCode == colorCode ? null : colorCode;

      // 數量 reset 成 1
      currentQuantity = 1;
    });
  }

  void selectSize(String size) {
    setState(() {
      // 該尺寸無庫存，直接 return
      var isAvailable = getAvailableSizes.contains(size);
      if (currentColorCode != null && !isAvailable) return;

      // 更新目前選取尺寸，如與當前尺寸相同，則取消選取
      currentSize = currentSize == size ? null : size;

      // 數量 reset 成 1
      currentQuantity = 1;
    });
  }

  void changeQuantity(int number) {
    setState(
      () {
        currentQuantity += number;
      },
    );
  }

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
                        onTap: () => selectColorCode(color.code),
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: color.code == currentColorCode
                                  ? Colors.black87
                                  : Colors.grey.shade200,
                              width: 2,
                            ),

                            // 已選擇庫存，對應到顏色庫存為 0 時，顏色會 disabled(透明度 0.2)
                            color: hexToColor('#${color.code}').withOpacity(
                              currentSize == null ||
                                      getAvailableColorCodes
                                          .contains(color.code)
                                  ? 1
                                  : .2,
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
                        onTap: () => selectSize(size),
                        child: Container(
                          height: 36,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: currentSize == size
                                ? Colors.grey[800]
                                : Colors.grey[200]?.withOpacity(
                                    currentColorCode == null ||
                                            getAvailableSizes.contains(size)
                                        ? 1
                                        : .5,
                                  ),
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: currentSize == size
                                    ? Colors.white
                                    : Colors.black.withOpacity(
                                        currentColorCode == null ||
                                                getAvailableSizes.contains(size)
                                            ? 1
                                            : .2,
                                      ),
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
                    onPressed:
                        currentQuantity <= 1 ? null : () => changeQuantity(-1),
                    iconSize: 36,
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        currentQuantity.toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: currentQuantity >= getAvailableStock
                        ? null
                        : () => changeQuantity(1),
                    iconSize: 36,
                    icon: const Icon(Icons.add_circle),
                  )
                ],
              ),
            )
          ],
        ),
        Visibility(
          visible: isAllSelected,
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              '剩餘數量：$getAvailableStock',
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: getAvailableStock == 0
              ? null
              : () {
                  print({currentColorCode, currentSize, currentQuantity});

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.07),
                        child: const Text(
                          '成功加入購物車',
                          textAlign: TextAlign.start,
                        )),
                    duration: const Duration(milliseconds: 500),
                  ));
                },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[800],
            minimumSize: const Size.fromHeight(60),
            disabledBackgroundColor: Theme.of(context)
                .primaryColor
                .withOpacity(.3), // Background Color
            disabledForegroundColor: Colors.grey[400], // Text Color
          ),
          child: Text(
            isAllSelected ? '加入購物車' : '請先選擇顏色/尺寸',
            style: const TextStyle(
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
