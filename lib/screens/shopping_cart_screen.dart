import 'package:flutter/material.dart';

import '../custom_ui/product_card.dart';
import '../model/product.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key, required this.productsList})
      : super(key: key);

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        //app bar title
        title: const Text('Shopping Cart'),
        centerTitle: true,
      ),

      //buy now button at bottom
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Buy Now'),
        icon: const Icon(Icons.shopping_cart_checkout_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (ctx, i) {
          return ProductCard(
            product: productsList[i],
            // onTap: () {},
          );
        },
      ),
    );
  }
}
