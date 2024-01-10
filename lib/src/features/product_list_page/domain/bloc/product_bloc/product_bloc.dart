// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/product/product_model.dart';
import 'package:shop_basket/src/features/product_list_page/data/product_controller.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_events.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductController productController;

  ProductBloc({required this.productController}) : super(ProductState()) {
    on<ProductsInitialEvent>(_productsInitial);
    on<AddNewProductEvent>(_addNewProductEvent);
    on<DeleteProductEvent>(_deleteProductEvent);
  }

  Future<void> _productsInitial(
      ProductsInitialEvent event, Emitter<ProductState> emit) async {
    emitter();
  }

  Future<void> _addNewProductEvent(
      AddNewProductEvent event, Emitter<ProductState> emit) async {
    productController
        .addProduct(ProductModel(name: 'milk', price: 2, quantity: 1));

    emitter();
  }

  Future<void> _deleteProductEvent(
      DeleteProductEvent event, Emitter<ProductState> emit) async {
    productController.deleteProduct(event.product!);

    emitter();
  }

  void emitter() {
    emit(state.copyWith(
      basket: productController.basket,
      screenState: ScreenState.ready,
    ));
  }
}
