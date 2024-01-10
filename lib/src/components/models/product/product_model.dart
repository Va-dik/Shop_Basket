class ProductModel {
  final String name;
  final double price;
  final int quantity;

  ProductModel(
      {required this.name, required this.price, required this.quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json['name'] as String,
        price: json['price'].toDouble(),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price, 'quantity': quantity};
  }
}
