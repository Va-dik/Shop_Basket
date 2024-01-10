import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';

abstract class BasketEvents {}

class GetBasketsEvent extends BasketEvents {}

class SaveBasketsEvent extends BasketEvents {}

class AddNewBasketEvent extends BasketEvents {}

class DeleteBasketEvent extends BasketEvents {
  final GeneralBasketModel basket;

  DeleteBasketEvent({required this.basket});
}

class EditBasketName extends BasketEvents {}

class UpdateBasket extends BasketEvents {}
