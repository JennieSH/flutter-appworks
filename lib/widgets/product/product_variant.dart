import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductVariant extends StatelessWidget {
  Product product;

  ProductVariant({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
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
          '${product.id}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'TWD. ${product.price}',
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
            BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
              builder: (context, state) {
                return Expanded(
                  child: Wrap(
                    spacing: 24, // 水平 gap
                    runSpacing: 12, // 垂直 gap
                    children: product.colors
                        .map(
                          (color) => GestureDetector(
                            onTap: () => context
                                .read<ProductSelectorCubit>()
                                .selectColorCode(color.code),
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: color.code == state.selectedColorCode
                                      ? Colors.black87
                                      : Colors.grey.shade200,
                                  width: 2,
                                ),

                                // 已選擇庫存，對應到顏色庫存為 0 時，顏色會 disabled(透明度 0.2)
                                color: hexToColor('#${color.code}').withOpacity(
                                  state.selectedSize == null ||
                                          state.getAvailableColorCodes
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
                );
              },
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
            BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
              builder: (context, state) {
                return Expanded(
                  child: Wrap(
                    spacing: 24, // 水平 gap
                    runSpacing: 12, // 垂直 gap
                    children: product.sizes
                        .map(
                          (size) => GestureDetector(
                            onTap: () => context
                                .read<ProductSelectorCubit>()
                                .selectSize(size),
                            child: Container(
                              height: 36,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: state.selectedSize == size
                                    ? Colors.grey[800]
                                    : Colors.grey[200]?.withOpacity(
                                        state.selectedColorCode == null ||
                                                state.getAvailableSizes
                                                    .contains(size)
                                            ? 1
                                            : .5,
                                      ),
                              ),
                              child: Center(
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    color: state.selectedSize == size
                                        ? Colors.white
                                        : Colors.black.withOpacity(
                                            state.selectedColorCode == null ||
                                                    state.getAvailableSizes
                                                        .contains(size)
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
                );
              },
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
            BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
              builder: (context, state) {
                return Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: state.selectedQuantity <= 1
                            ? null
                            : () => context
                                .read<ProductSelectorCubit>()
                                .changeQuantity(-1),
                        iconSize: 36,
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            state.selectedQuantity.toString(),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed:
                            state.selectedQuantity >= state.getAvailableStock
                                ? null
                                : () => context
                                    .read<ProductSelectorCubit>()
                                    .changeQuantity(1),
                        iconSize: 36,
                        icon: const Icon(Icons.add_circle),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
        BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
          builder: (context, state) {
            return Visibility(
              visible: state.isAllSelected,
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  '剩餘數量：${state.getAvailableStock}',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state.getAvailableStock == 0
                  ? null
                  : () {
                      print({
                        state.selectedColorCode,
                        state.selectedSize,
                        state.selectedQuantity
                      });

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
                state.isAllSelected ? '加入購物車' : '請先選擇顏色/尺寸',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          product.note,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.description,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          '加工產地/${product.place}',
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
