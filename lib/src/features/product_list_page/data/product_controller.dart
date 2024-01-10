import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/components/models/product/product_model.dart';

class ProductController {
  final GeneralBasketModel basket;

  ProductController({required this.basket});

  void addProduct(ProductModel product) => basket.products.add(product);

  void deleteProduct(ProductModel product) => basket.products.remove(product);
}
