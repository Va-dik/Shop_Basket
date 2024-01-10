import 'package:shop_basket/src/components/models/product/product_model.dart';

abstract class ProductEvent {
  final ProductModel? product;
  ProductEvent({this.product});
}

class ProductsInitialEvent extends ProductEvent{
  ProductsInitialEvent({super.product});
}

class AddNewProductEvent extends ProductEvent {
  AddNewProductEvent({required super.product});
}

class DeleteProductEvent extends ProductEvent {
  DeleteProductEvent({required super.product});
}

class EditProductEvent extends ProductEvent {
  EditProductEvent({required super.product});
}

class IncrementProductEvent extends ProductEvent {
  IncrementProductEvent({required super.product});
}

class DecrementProductEvent extends ProductEvent {
  DecrementProductEvent({required super.product});
}
