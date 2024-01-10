import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/components/models/product/product_model.dart';
import 'package:shop_basket/src/features/product_list_page/data/product_controller.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_bloc.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_events.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_state.dart';

class ProductListPage extends StatelessWidget {
  final GeneralBasketModel basket;
  const ProductListPage({Key? key, required this.basket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            productController: ProductController(
              basket: basket,
            ),
          ),
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            switch (state.screenState) {
              case ScreenState.ready:
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.basket!.products.length,
                        itemBuilder: (context, index) {
                          if (state.basket!.isInstance) {
                            ProductModel product =
                                state.basket!.products[index];
                            return ListTile(
                              title: Text(product.name),
                              subtitle: Text(product.price.toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${product.quantity}'),
                                  IconButton(
                                      onPressed: () => context
                                          .read<ProductBloc>()
                                          .add(DeleteProductEvent(
                                              product: product)),
                                      icon: Icon(Icons.cancel))
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('WRONG'),
                            );
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Добавляем новый продукт с помощью ProductBloc
                        context.read<ProductBloc>().add(
                              AddNewProductEvent(
                                product: ProductModel(
                                    name: 'milk', price: 2, quantity: 1),
                              ),
                            );
                      },
                      child: const Text('Добавить продукт в корзину'),
                    ),
                  ],
                );
              case ScreenState.preload:
                context.read<ProductBloc>().add(ProductsInitialEvent());
                return const Center(child: CircularProgressIndicator());
              default:
                return Text('fsafsa');
            }
          }),
        ),
      ),
    );
  }

  
}
