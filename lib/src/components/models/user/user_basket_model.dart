import 'package:shop_basket/src/components/models/product/product_model.dart';

class UserBasketModel {
  final String username;
  List<ProductModel> basket = [];

  UserBasketModel({this.username = 'Пользователь', this.basket = const []});

  void addProductMethod(ProductModel product) => basket.add(product);
  void deleteProductMethod(ProductModel product) => basket.remove(product);

  factory UserBasketModel.fromJson(Map<String, dynamic> json) => UserBasketModel(
      username: json['name'],
      basket: (json['basket'] as List<dynamic>)
          .map((item) => ProductModel.fromJson(item))
          .toList());

  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'basket': basket.map((product) => product.toJson()).toList()
    };
  }
}
