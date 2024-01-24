part of 'package:shop_basket/src/components/imports/import_headers.dart';

class ProductListPage extends StatelessWidget {
  final GeneralBasketModel basket;
  final Function(GeneralBasketModel) onProductAction;

  const ProductListPage(
      {Key? key, required this.basket, required this.onProductAction})
      : super(key: key);

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
              case ScreenStateEnum.ready:
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
                                      onPressed: () {
                                        context.read<ProductBloc>().add(
                                              ProductOperationsEvent(
                                                product: product,
                                                operationType:
                                                    OperationTypeEnum.delete,
                                              ),
                                            );
                                        onProductAction(state.basket!);
                                      },
                                      icon: const Icon(Icons.cancel))
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
                        context.read<ProductBloc>().add(ProductOperationsEvent(
                              operationType: OperationTypeEnum.add,
                              product: ProductModel(
                                name: 'milkdsa',
                                price: 1,
                                quantity: 2,
                              ),
                            ));

                        onProductAction(state.basket!);
                      },
                      child: const Text('Добавить продукт в корзину'),
                    ),
                  ],
                );
              default:
                return Text('Что-то пошло не так');
            }
          }),
        ),
      ),
    );
  }
}
