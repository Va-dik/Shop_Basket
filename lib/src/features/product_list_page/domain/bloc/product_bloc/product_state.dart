import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/components/models/product/product_model.dart';

class ProductState {
  GeneralBasketModel? basket;
  final ScreenState screenState;

  ProductState({this.basket, this.screenState = ScreenState.preload});

  ProductState copyWith({
    GeneralBasketModel? basket,
    ScreenState? screenState,
  }) {
    return ProductState(
      basket: basket ?? this.basket,
      screenState: screenState ?? this.screenState,
    );
  }
}
