import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorCode extends StatelessWidget {
  const ProductColorCode({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
