import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../provider/data_provider.dart';
import '../screens/add_products_screen.dart';

//custom card to display a single product item (or shopping item)
class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
    //required this.onTap
  }) : super(key: key);

  final Product product;
  // final VoidCallback onTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    DataProvider data = Provider.of<DataProvider>(context);

    return Card(
      elevation: 10,
      // change card color according to item is being added or not?
      color: widget.product.isAdded
          ? const Color.fromARGB(255, 192, 255, 194)
          : null,

      //creating rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(
          horizontal: mq.height * .02, vertical: mq.height * .015),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: mq.width * .05,
            top: mq.height * .01,
            bottom: mq.height * .01,
            right: mq.height * .01),

        //product image
        leading: Image.asset('assets/images/${widget.product.image}'),

        //product title (or name)
        title: Text(widget.product.title),

        //product subtitle (or price)
        subtitle: Text('₹ ${widget.product.price}.00'),

        //add to cart button
        trailing: widget.product.isAdded
            ? IconButton(
                onPressed: () {
                  // widget.onTap();
                  data.decrementCount();
                  //remove item from shopping cart when this button is pressed
                  setState(() {
                    widget.product.isAdded = false;
                  });
                },
                icon: Image.asset('assets/images/done.png'))
            : ElevatedButton.icon(
                onPressed: () {
                  // widget.onTap();
                  data.incrementCount();
                  //add item to shopping cart when this button is pressed
                  setState(() {
                    widget.product.isAdded = true;
                  });

                  //show item added snackbar
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Item Added Successfully!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blue.withOpacity(.8),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5, shape: const StadiumBorder()),
                icon: const Icon(Icons.shopping_cart_checkout_rounded),
                label: const Text('Add')),
      ),
    );
  }
}
