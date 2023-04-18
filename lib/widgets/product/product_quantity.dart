import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    onPressed: state.selectedQuantity >= state.getAvailableStock
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
    );
  }
}
