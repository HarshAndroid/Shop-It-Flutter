import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/data_provider.dart';
import 'screens/add_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //change notifier should be wrapped around root navigator
    // to access in all screens
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MaterialApp(
          title: 'Shop It',
          // theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: AddProductsScreen()),
    );
  }
}
