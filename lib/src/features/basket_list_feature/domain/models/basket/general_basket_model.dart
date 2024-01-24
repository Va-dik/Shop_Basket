import 'package:shop_basket/src/features/product_list_feature/domain/models/product/product_model.dart';

class GeneralBasketModel {
  String name;
  final List<ProductModel> products;
  int get amountProducts => products.length;
  bool get isInstance => products.isNotEmpty && name.isNotEmpty;

  GeneralBasketModel({this.name = 'Корзина', required this.products});

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
