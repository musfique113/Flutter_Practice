import 'package:flutter/material.dart';


class Product {
  String name;
  double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Apple', price: 10.0),
    Product(name: 'Lime', price: 20.0),
    Product(name: 'Strawberry', price: 30.0),
    Product(name: 'Banana', price: 15.0),
    Product(name: 'Orange', price: 25.0),
    Product(name: 'Grape', price: 12.0),
    Product(name: 'Watermelon', price: 40.0),
  ];


  int totalProducts = 0;

  void incrementCounter(int index) {
    setState(() {
      products[index].counter++;
      totalProducts++;
      if (products[index].counter == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text(
                  'You\'ve bought 5 ${products[index].name}!'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(totalProducts: totalProducts),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () => incrementCounter(index),
              child: Text('Buy Now'),
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final int totalProducts;

  CartPage({required this.totalProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total products bought: $totalProducts'),
      ),
    );
  }
}
