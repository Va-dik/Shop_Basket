import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/features/basket_list_page/domain/bloc/basket_bloc/basket_bloc.dart';
import 'package:shop_basket/src/features/basket_list_page/domain/bloc/basket_bloc/basket_events.dart';
import 'package:shop_basket/src/features/basket_list_page/domain/bloc/basket_bloc/basket_state.dart';
import 'package:shop_basket/src/features/product_list_page/data/product_controller.dart';
import 'package:shop_basket/src/features/product_list_page/domain/bloc/product_bloc/product_bloc.dart';
import 'package:shop_basket/src/features/product_list_page/presentation/product_list_page.dart';

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
              case ScreenState.preload:
                context.read<BasketBloc>().add(GetBasketsEvent());
                return const CircularProgressIndicator();
              case ScreenState.isLoading:
                return const Center(child: CircularProgressIndicator());
              case ScreenState.error:
                return const Center(
                  child: Text('Something get wrong'),
                );
              case ScreenState.ready:
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.basketList?.generalBasketList.length,
                        itemBuilder: (context, index) {
                          GeneralBasketModel basket =
                              state.basketList!.generalBasketList[index];
                          return ListTile(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductListPage(
                                basket: basket,
                              );
                            })).then((basket) {
                              try {
                                basketBloc.add(UpdateBasket());
                              } catch (e) {}
                            }),
                            title: Text(basket.name),
                            subtitle: Text(
                                'Количество товаров: ${basket.amountProducts}'),
                            trailing: IconButton(
                                icon: const Icon(Icons.cancel_outlined),
                                onPressed: () {
                                  basketBloc.add(
                                    DeleteBasketEvent(basket: basket),
                                  );
                                  basketBloc.add(SaveBasketsEvent());
                                }),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              basketBloc.add(AddNewBasketEvent());
                              basketBloc.add(SaveBasketsEvent());
                            },
                            child: const Text('Добавить корзину')),
                      ],
                    )
                  ],
                );
            }
          }),
        ),
      ),
    );
  }
}
