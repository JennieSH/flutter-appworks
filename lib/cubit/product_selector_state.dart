part of 'product_selector_cubit.dart';

class ProductSelectorState extends Equatable {
  late int selectedQuantity;
  late Product? product;
  late String? selectedColorCode;
  late String? selectedSize;

  ProductSelectorState({
    required this.selectedQuantity,
    this.product,
    this.selectedColorCode,
    this.selectedSize,
  });

  @override
  List<Object?> get props =>
      [selectedQuantity, product, selectedColorCode, selectedSize];

  // 已選擇顏色&&尺寸
  bool get isAllSelected => selectedColorCode != null && selectedSize != null;

  // 當前組合的庫存量
  int get getAvailableStock {
    var stock = 0;

    if (product == null) return stock;
    if (isAllSelected) {
      for (var i = 0; i < product!.variants.length; i++) {
        var colorCode = product!.variants[i].colorCode;
        var size = product!.variants[i].size;

        if (selectedColorCode == colorCode && selectedSize == size) {
          return product!.variants[i].stock;
        }
      }
    }

    return stock;
  }

  // 當前可選的顏色
  Set get getAvailableColorCodes {
    Set colorCodes = {};

    if (product == null) return colorCodes;
    if (selectedSize != null) {
      for (var i = 0; i < product!.variants.length; i++) {
        var colorCode = product!.variants[i].colorCode;
        var size = product!.variants[i].size;
        var stock = product!.variants[i].stock;

        if (selectedSize == size && stock != 0) {
          colorCodes.add(colorCode);
        }
      }
    }

    return colorCodes;
  }

  // 當前可選的尺寸
  Set get getAvailableSizes {
    Set sizes = {};

    if (product == null) return sizes;
    if (selectedColorCode != null) {
      for (var i = 0; i < product!.variants.length; i++) {
        var colorCode = product!.variants[i].colorCode;
        var size = product!.variants[i].size;
        var stock = product!.variants[i].stock;

        if (selectedColorCode == colorCode && stock != 0) {
          sizes.add(size);
        }
      }
    }

    return sizes;
  }

  ProductSelectorState copyWith({
    Product? product,
    String? selectedColorCode,
    String? selectedSize,
    int? selectedQuantity,
  }) {
    return ProductSelectorState(
      product: product ?? this.product,
      selectedColorCode: selectedColorCode ?? this.selectedColorCode,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
    );
  }
}
