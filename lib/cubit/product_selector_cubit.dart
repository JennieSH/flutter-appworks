import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appworks/models/product.dart';

part 'product_selector_state.dart';

class ProductSelectorCubit extends Cubit<ProductSelectorState> {
  ProductSelectorCubit()
      : super(
          ProductSelectorState(
            selectedQuantity: 1,
            product: null,
            selectedColorCode: null,
            selectedSize: null,
          ),
        );

  void initProduct(Product product) {
    emit(state.copyWith(product: product));
  }

  void selectColorCode(String colorCode) {
    // 該顏色無庫存，直接 return
    var isAvailable = state.getAvailableColorCodes.contains(colorCode);

    if (state.selectedSize != null && !isAvailable) return;

    // 更新目前選取顏色，如與當前顏色相同，則取消選取 + 數量 reset 成 1
    emit(
      state.copyWith(
        selectedColorCode:
            state.selectedColorCode == colorCode ? null : colorCode,
        selectedQuantity: 1,
      ),
    );
  }

  void selectSize(String size) {
    // 該尺寸無庫存，直接 return
    var isAvailable = state.getAvailableSizes.contains(size);
    if (state.selectedColorCode != null && !isAvailable) return;

    // 更新目前選取尺寸，如與當前尺寸相同，則取消選取 + 數量 reset 成 1
    emit(
      state.copyWith(
        selectedSize: state.selectedSize == size ? null : size,
        selectedQuantity: 1,
      ),
    );
  }

  void changeQuantity(int quantity) {
    emit(
      state.copyWith(selectedQuantity: state.selectedQuantity + quantity),
    );
  }
}
