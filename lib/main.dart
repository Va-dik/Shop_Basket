import 'package:flutter/material.dart';
import 'package:shop_basket/src/components/imports/import_headers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'SHOP BASKET',
        home: const BasketListPage(),
      );
}
