import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_basket/src/components/enums/operation_type_enum.dart';
import 'package:shop_basket/src/components/enums/screen_state_enum.dart';
import 'package:shop_basket/src/features/basket_list_feature/domain/models/basket/general_basket_list_model.dart';
import 'package:shop_basket/src/features/basket_list_feature/domain/models/basket/general_basket_model.dart';
import 'package:shop_basket/src/features/product_list_feature/domain/models/product/product_model.dart';
import 'package:shop_basket/src/features/basket_list_feature/data/repositories/interface_basket_repository.dart';
import 'package:shop_basket/src/core/data/repositories/interface_operations_repository.dart';

part 'package:shop_basket/src/features/basket_list_feature/data/datasources/basket_repository_implement.dart';
part 'package:shop_basket/src/features/basket_list_feature/presentation/bloc/basket_bloc.dart';
part 'package:shop_basket/src/features/basket_list_feature/presentation/bloc/basket_events.dart';
part 'package:shop_basket/src/features/basket_list_feature/presentation/bloc/basket_state.dart';
part 'package:shop_basket/src/features/basket_list_feature/presentation/pages/basket_list_page.dart';
part 'package:shop_basket/src/features/product_list_feature/data/services/product_controller.dart';
part 'package:shop_basket/src/features/product_list_feature/presentation/bloc/product_bloc.dart';
part 'package:shop_basket/src/features/product_list_feature/presentation/bloc/product_events.dart';
part 'package:shop_basket/src/features/product_list_feature/presentation/bloc/product_state.dart';
part 'package:shop_basket/src/features/product_list_feature/presentation/product_list_page.dart';
