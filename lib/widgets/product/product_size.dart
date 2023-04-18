import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
