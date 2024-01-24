part of 'package:shop_basket/src/components/imports/import_headers.dart';

final class BasketsRepositoryImpl implements IBasketsRepository {
  GeneralBasketListModel generalBaskets = GeneralBasketListModel();

  Future<String> _getJsonPath() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory()
          ..create(recursive: true);

    return '${documentsDirectory.path}/data.json';
  }

  @override
  Future<GeneralBasketListModel> getBaskets() async {
    final String jsonFilePath = await _getJsonPath();
    final File file = File(jsonFilePath);

    if (await file.exists()) {
      final String jsonData = await file.readAsString();

      if (jsonData.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(jsonData);

        return generalBaskets = GeneralBasketListModel.fromJson(data);
      } else {
        // json data is empty.
        return generalBaskets = GeneralBasketListModel(generalBasketList: []);
      }
    } else {
      // json file don't exist.
      return generalBaskets = GeneralBasketListModel(generalBasketList: []);
    }
  }

  @override
  Future<void> saveBaskets() async {
    final String jsonString = json.encode(generalBaskets.toJson());

    await File(await _getJsonPath()).writeAsString(jsonString);
  }

  @override
  Future<GeneralBasketListModel> addNew(GeneralBasketModel model) async {
    generalBaskets.generalBasketList.add(model);
    return generalBaskets;
  }

  @override
  Future<GeneralBasketListModel> delete(model) async {
    generalBaskets.generalBasketList.remove(model);
    return generalBaskets;
  }

  @override
  Future<GeneralBasketListModel> edit(model) async {
    generalBaskets.generalBasketList;
    return generalBaskets;
  }

  @override
  Future<GeneralBasketListModel> deleteAll() async {
    generalBaskets.generalBasketList.clear();
    return generalBaskets;
  }
}
