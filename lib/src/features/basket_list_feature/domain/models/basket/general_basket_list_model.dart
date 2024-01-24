import 'package:shop_basket/src/features/basket_list_feature/domain/models/basket/general_basket_model.dart';

class GeneralBasketListModel {
  final List<GeneralBasketModel> generalBasketList;
  int get amountBaskets => generalBasketList.length;

  GeneralBasketListModel({this.generalBasketList = const []});

  factory GeneralBasketListModel.fromJson(Map<String, dynamic> json) =>
      GeneralBasketListModel(
        generalBasketList: (json['general_basket_list'] as List<dynamic>)
            .map((basket) => GeneralBasketModel.fromJson(basket))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      'general_basket_list':
          generalBasketList.map((basket) => basket.toJson()).toList()
    };
  }
}
