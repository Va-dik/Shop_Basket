part of 'package:shop_basket/src/components/imports/import_headers.dart';

class BasketState {
  final GeneralBasketListModel? basketList;
  final ScreenStateEnum screenState;

  BasketState({this.basketList, this.screenState = ScreenStateEnum.preload});

  BasketState copyWith({
    GeneralBasketListModel? basketList,
    ScreenStateEnum? screenState,
  }) {
    return BasketState(
      basketList: basketList ?? this.basketList,
      screenState: screenState ?? this.screenState,
    );
  }
}
