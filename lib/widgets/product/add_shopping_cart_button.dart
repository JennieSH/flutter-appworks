import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddShoppingCartButton extends StatelessWidget {
  const AddShoppingCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
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
    );
  }
}
