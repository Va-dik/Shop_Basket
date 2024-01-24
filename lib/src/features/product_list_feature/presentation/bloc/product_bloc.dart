// ignore_for_file: invalid_use_of_visible_for_testing_member

part of 'package:shop_basket/src/components/imports/import_headers.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductController productController;

  ProductBloc({required this.productController})
      : super(ProductState(
          basket: productController.basket,
          screenState: ScreenStateEnum.ready,
        )) {
    on<ProductOperationsEvent>(_productOperations);
  }

  Future<void> _productOperations(
      ProductOperationsEvent event, Emitter<ProductState> emit) async {
    bool isDefault = false;
    switch (event.operationType) {
      case OperationTypeEnum.add:
        {
          productController
              .addProduct(ProductModel(name: 'milk', price: 2, quantity: 1));
          break;
        }
      case OperationTypeEnum.delete:
        {
          productController.deleteProduct(event.product);
          break;
        }
      case OperationTypeEnum.edit:
        {
          break;
        }
      default:
        {
          isDefault = true;
          emitter(screenState: ScreenStateEnum.error);
        }
    }
    if (!isDefault) {
      emitter();
    }
    emitter();
  }

  void emitter({ScreenStateEnum screenState = ScreenStateEnum.ready}) =>
      emit(state.copyWith(
        basket: productController.basket,
        screenState: screenState,
        isAdded: true,
      ));
}
