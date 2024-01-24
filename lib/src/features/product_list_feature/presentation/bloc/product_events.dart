part of 'package:shop_basket/src/components/imports/import_headers.dart';

abstract class ProductEvent {
  final ProductModel product;
  const ProductEvent({required this.product});
}

class ProductOperationsEvent extends ProductEvent {
  final OperationTypeEnum operationType;
  const ProductOperationsEvent(
      {required super.product, required this.operationType});
}

class IncrementProductEvent extends ProductEvent {
  const IncrementProductEvent({required super.product});
}

class DecrementProductEvent extends ProductEvent {
  const DecrementProductEvent({required super.product});
}
