part of 'package:shop_basket/src/components/imports/import_headers.dart';

class ProductState {
  final GeneralBasketModel? basket;
  final ScreenStateEnum screenState;

  ProductState({
    this.basket,
    this.screenState = ScreenStateEnum.preload,
  });

  ProductState copyWith({
    GeneralBasketModel? basket,
    ScreenStateEnum? screenState,
    bool? isAdded,
  }) {
    return ProductState(
      basket: basket ?? this.basket,
      screenState: screenState ?? this.screenState,
    );
  }
}
