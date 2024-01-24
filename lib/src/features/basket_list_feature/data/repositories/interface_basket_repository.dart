import 'package:shop_basket/src/features/basket_list_feature/domain/models/basket/general_basket_list_model.dart';
import 'package:shop_basket/src/features/basket_list_feature/domain/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/core/data/repositories/interface_operations_repository.dart';

abstract interface class IBasketsRepository
    implements
        IOperationsRepository<GeneralBasketListModel, GeneralBasketModel> {
  Future<GeneralBasketListModel> getBaskets();
  Future<void> saveBaskets();
  @override
  Future<GeneralBasketListModel> addNew(GeneralBasketModel model);
  @override
  Future<GeneralBasketListModel> delete(GeneralBasketModel model);
  @override
  Future<GeneralBasketListModel> edit(GeneralBasketModel model);
  @override
  Future<GeneralBasketListModel> deleteAll();
}
