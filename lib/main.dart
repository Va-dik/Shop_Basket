import 'package:flutter/material.dart';
import 'package:shop_basket/src/features/basket_list_page/presentations/basket_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SHOP BASKET',
      home:  BasketListPage(),
    );
  }
}
