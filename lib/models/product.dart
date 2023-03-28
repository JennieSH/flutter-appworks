class Product {
  late String name;
  late String url;
  late int price;

  Product({required this.name, required this.url, required this.price});
}

class Category {
  late String name;
  List<Product> products;

  Category({required this.name, required this.products});
}

List<Product> _mockProducts = List.filled(
  5,
  Product(
    name: 'UNIQLO 特級極輕羽絨外套',
    url:
        'https://images.unsplash.com/photo-1543872084-c7bd3822856f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    price: 323,
  ),
);

Category women = Category(name: '女裝', products: _mockProducts);
Category men = Category(name: '男裝', products: _mockProducts);
Category accessories = Category(name: '配件', products: _mockProducts);
