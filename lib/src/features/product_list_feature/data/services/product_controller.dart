part of 'package:shop_basket/src/components/imports/import_headers.dart';

class ProductController {
  final GeneralBasketModel basket;

  ProductController({required this.basket});

  void addProduct(ProductModel product) => basket.products.add(product);

  void deleteProduct(ProductModel product) => basket.products.remove(product);
}
