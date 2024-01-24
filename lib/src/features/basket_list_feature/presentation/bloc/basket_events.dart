part of 'package:shop_basket/src/components/imports/import_headers.dart';

abstract class BasketEvents {
  const BasketEvents();
}

class GetBasketsEvent extends BasketEvents {}

class SaveBasketsEvent extends BasketEvents {}

class UpdateBasketStateEvent extends BasketEvents {}

class BasketOperationsEvent extends BasketEvents {
  final OperationTypeEnum operationType;
  final GeneralBasketModel? basket;

  const BasketOperationsEvent({this.basket, required this.operationType});
}
