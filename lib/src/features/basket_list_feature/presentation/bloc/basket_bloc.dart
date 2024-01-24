// ignore_for_file: invalid_use_of_visible_for_testing_member

part of 'package:shop_basket/src/components/imports/import_headers.dart';

final class BasketBloc extends Bloc<BasketEvents, BasketState> {
  final IBasketsRepository basketService = BasketsRepositoryImpl();

  BasketBloc() : super(BasketState()) {
    on<GetBasketsEvent>(_getBasketData);
    on<SaveBasketsEvent>(_saveBaskets);
    on<BasketOperationsEvent>(_basketOperations);
    on<UpdateBasketStateEvent>(_updateBasketState);
  }

  Future<void> _getBasketData(
      GetBasketsEvent event, Emitter<BasketState> emit) async {
    await basketService.getBaskets().thenEmit(emit);
  }

  Future<void> _saveBaskets(
      SaveBasketsEvent event, Emitter<BasketState> emit) async {
    await basketService.saveBaskets();
  }

  Future<void> _updateBasketState(
      UpdateBasketStateEvent event, Emitter<BasketState> emit) async {
    emit(state.copyWith(screenState: ScreenStateEnum.ready));
  }

  Future<void> _basketOperations(
      BasketOperationsEvent event, Emitter<BasketState> emit) async {
    switch (event.operationType) {
      case OperationTypeEnum.add:
        {
          await basketService.addNew(event.basket!).thenEmit(emit);
          break;
        }
      case OperationTypeEnum.delete:
        {
          await basketService.delete(event.basket!).then((basketList) => emit(
                state.copyWith(
                  screenState: ScreenStateEnum.ready,
                ),
              ));
          break;
        }
      case OperationTypeEnum.edit:
        {
          await basketService.edit(event.basket!).thenEmit(emit);
          break;
        }

      default:
        {
          emit(state.copyWith(screenState: ScreenStateEnum.error));
        }
    }
  }
}

extension FutureThenExtension on Future<GeneralBasketListModel> {
  Future<void> thenEmit(Emitter<BasketState> emit) async {
    try {
      return then((basketList) => emit(
            BasketState().copyWith(
                basketList: basketList, screenState: ScreenStateEnum.ready),
          ));
    } catch (error) {}
  }
}
