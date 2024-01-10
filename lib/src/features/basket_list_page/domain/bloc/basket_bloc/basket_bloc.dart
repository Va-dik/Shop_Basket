import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/features/basket_list_page/data/basket_service.dart';
import 'package:shop_basket/src/features/basket_list_page/domain/bloc/basket_bloc/basket_events.dart';
import 'package:shop_basket/src/features/basket_list_page/domain/bloc/basket_bloc/basket_state.dart';

class BasketBloc extends Bloc<BasketEvents, BasketState> {
  final BasketService basketService = BasketService();

  BasketBloc() : super(BasketState()) {
    on<GetBasketsEvent>(_getBasketData);
    on<SaveBasketsEvent>(_saveBaskets);
    on<AddNewBasketEvent>(_addNewBasket);
    on<DeleteBasketEvent>(_deleteBasket);
    on<EditBasketName>(_editBasketName);
    on<UpdateBasket>(_updateBasket);
  }

  Future<void> _getBasketData(
      GetBasketsEvent event, Emitter<BasketState> emit) async {
    basketService.generalBaskets = await basketService.getBaskets();

    emit(state.copyWith(
      basketList: basketService.generalBaskets,
      screenState: ScreenState.ready,
    ));
  }

  Future<void> _addNewBasket(
      AddNewBasketEvent event, Emitter<BasketState> emit) async {
    basketService.addBasket(
        GeneralBasketModel(name: 'НОВАЯ КАРЗИИИНААААА :))))', products: []));
    emit(state.copyWith(
      basketList: basketService.generalBaskets,
      screenState: ScreenState.ready,
    ));
  }

  Future<void> _saveBaskets(
      SaveBasketsEvent event, Emitter<BasketState> emit) async {
    basketService.saveBaskets();
  }

  Future<void> _deleteBasket(
      DeleteBasketEvent event, Emitter<BasketState> emit) async {
    basketService.deleteBasket(event.basket);
    emit(state.copyWith(
      basketList: basketService.generalBaskets,
      screenState: ScreenState.ready,
    ));
  }

  Future<void> _editBasketName(
      EditBasketName event, Emitter<BasketState> emit) async {}

  Future<void> _updateBasket(
      UpdateBasket event, Emitter<BasketState> emit) async {
    emit(state.copyWith(
      screenState: ScreenState.ready,
    ));
  }
}
