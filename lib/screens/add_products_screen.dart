import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_ui/product_card.dart';
import '../model/product.dart';
import '../provider/data_provider.dart';
import 'shopping_cart_screen.dart';

//for getting device width & height
late Size mq;

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  //containing all the items or list of available products
  final List<Product> productsList = [
    Product(title: 'Cap', price: '99', image: 'cap.png'),
    Product(title: 'Sport Shoes', price: '499', image: 'sneakers.png'),
    Product(title: 'Backpack', price: '749', image: 'backpack.png'),
    Product(title: 'Running Shoes', price: '499', image: 'running_shoes.png'),
    Product(title: 'Hand Bag', price: '299', image: 'handbag.png'),
    Product(title: 'Rocking Horse', price: '399', image: 'rocking_horse.png'),
    Product(title: 'Smart Watch', price: '999', image: 'smart_watch.png'),
    Product(title: 'T-shirt', price: '449', image: 't_shirt.png'),
    Product(title: 'Puzzle', price: '349', image: 'puzzle.png'),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Consumer<DataProvider>(
      builder: (context, value, child) => Scaffold(
        //app bar
        appBar: AppBar(
          //app bar title
          title: const Text('Add Products'),
          centerTitle: true,

          //home icon in starting
          leading: const Icon(CupertinoIcons.home),

          //add shopping cart button
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Open shopping cart',
              onPressed: () {
                //for navigating to shopping cart screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ShoppingCartScreen(
                            productsList: productsList
                                .where((e) => e.isAdded == true)
                                .toList()))).then((value) {
                  //for updating UI
                  //executed when this screen is destroyed (or back is pressed by user)
                  setState(() {
                    productsList;
                  });
                });
              },
            ),
          ],
        ),

        //open cart button at bottom with item count
        floatingActionButton: SizedBox(
          width: mq.width * .5,
          height: mq.height * .1,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    //for navigating to shopping cart screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ShoppingCartScreen(
                                productsList: productsList
                                    .where((e) => e.isAdded == true)
                                    .toList()))).then((value) {
                      //for updating UI
                      //executed when this screen is destroyed (or back is pressed by user)
                      setState(() {
                        productsList;
                      });
                    });
                  },
                  label: const Text('Open Cart'),
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),

              //item count label
              Positioned(
                top: 0,
                right: mq.width * .025,
                child: MaterialButton(
                    elevation: 0,
                    onPressed: () {},
                    color: Colors.red,
                    minWidth: 0,
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                    child: Text(
                        // '${productsList.where((e) => e.isAdded).length}',
                        '${value.itemCount}',
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        //products list
        body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (ctx, i) {
            return ProductCard(
              product: productsList[i],
              // onTap: () {
              //   setState(() {
              //     productsList;
              //   });
              // },
            );
          },
        ),
      ),
    );
  }
}
