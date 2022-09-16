//class representing single product information or details
class Product {
  final String title;
  final String price;
  final String image;
  bool isAdded = false;

  Product({required this.title, required this.price, required this.image});
}
