import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_list_model.dart';
import 'package:shop_basket/src/components/models/basket/general_basket_model.dart';

class BasketService {
  GeneralBasketListModel generalBaskets =
      GeneralBasketListModel(generalBasketList: []);

  Future<String> getJsonPath() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory()
          ..create(recursive: true);

    return '${documentsDirectory.path}/data.json';
  }

  Future<GeneralBasketListModel> getBaskets() async {
    final String jsonFilePath = await getJsonPath();
    final File file = File(jsonFilePath);

    if (await file.exists()) {
      final String jsonData = await file.readAsString();

      if (jsonData.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(jsonData);

        return GeneralBasketListModel.fromJson(data);
      } else {
        return GeneralBasketListModel(generalBasketList: []);
      }
    } else {
      return GeneralBasketListModel(generalBasketList: []);
    }
  }

  Future<void> saveBaskets() async {
    final String jsonString = json.encode(generalBaskets.toJson());

    await File(await getJsonPath()).writeAsString(jsonString);
  }

  void addBasket(GeneralBasketModel basket) =>
      generalBaskets.generalBasketList.add(basket);

  void deleteBasket(GeneralBasketModel basket) =>
      generalBaskets.generalBasketList.remove(basket);
}
