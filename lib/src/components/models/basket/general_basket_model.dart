import 'package:shop_basket/src/components/models/product/product_model.dart';

class GeneralBasketModel {
  String name;
  final List<ProductModel> products;
  int get amountProducts => products.length;

  GeneralBasketModel({this.name = 'Корзина', required this.products});

  bool get isInstance => products.isNotEmpty && name.isNotEmpty;

  factory GeneralBasketModel.fromJson(Map<String, dynamic> json) =>
      GeneralBasketModel(
        name: json['name'],
        products: (json['products'] as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'products': products.map((product) => product.toJson()).toList()
    };
  }
}
