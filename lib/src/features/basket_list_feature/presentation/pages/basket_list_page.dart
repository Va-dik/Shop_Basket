part of 'package:shop_basket/src/components/imports/import_headers.dart';

class BasketListPage extends StatelessWidget {
  const BasketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOOOOP BAAASKEEEEET!!!'),
      ),
      body: SafeArea(
        child: BlocProvider<BasketBloc>(
          create: (context) => BasketBloc(),
          child:
              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
            final BasketBloc basketBloc = context.read<BasketBloc>();
            switch (state.screenState) {
              case ScreenStateEnum.preload:
                basketBloc.add(GetBasketsEvent());
                return const CircularProgressIndicator();
              case ScreenStateEnum.isLoading:
                return const Center(child: CircularProgressIndicator());
              case ScreenStateEnum.error:
                return const Center(
                  child: Text('Что-то пошло не так'),
                );
              case ScreenStateEnum.ready:
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.basketList?.amountBaskets,
                        itemBuilder: (context, index) {
                          GeneralBasketModel basket =
                              state.basketList!.generalBasketList[index];
                          return ListTile(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductListPage(
                                  basket: basket,
                                  onProductAction: (GeneralBasketModel basket) {
                                    basketBloc.add(SaveBasketsEvent());
                                  });
                            })).then((_) =>
                                basketBloc.add(UpdateBasketStateEvent())),
                            title: Text(basket.name),
                            subtitle: Text(
                                'Количество товаров: ${basket.amountProducts}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              onPressed: () {
                                basketBloc.add(
                                  BasketOperationsEvent(
                                    basket: basket,
                                    operationType: OperationTypeEnum.delete,
                                  ),
                                );
                                basketBloc.add(SaveBasketsEvent());
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          basketBloc.add(
                            BasketOperationsEvent(
                              basket: GeneralBasketModel(products: []),
                              operationType: OperationTypeEnum.add,
                            ),
                          );
                          basketBloc.add(SaveBasketsEvent());
                        },
                        child: const Text('Добавить корзину'))
                  ],
                );
            }
          }),
        ),
      ),
    );
  }
}
