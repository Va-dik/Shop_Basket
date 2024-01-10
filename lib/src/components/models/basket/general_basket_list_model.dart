import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';

class GeneralBasketListModel {
   List<GeneralBasketModel> generalBasketList;

  GeneralBasketListModel({required this.generalBasketList});

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
