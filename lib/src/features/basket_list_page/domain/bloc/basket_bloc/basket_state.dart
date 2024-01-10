import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_list_model.dart';

class BasketState {
  GeneralBasketListModel? basketList;
  final ScreenState screenState;

  BasketState({this.basketList, this.screenState = ScreenState.preload});

  BasketState copyWith({
    GeneralBasketListModel? basketList,
    ScreenState? screenState,
  }) {
    return BasketState(
      basketList: basketList ?? this.basketList,
      screenState: screenState ?? this.screenState,
    );
  }
}
