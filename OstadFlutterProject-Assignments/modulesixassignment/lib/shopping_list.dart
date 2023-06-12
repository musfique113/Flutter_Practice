import 'package:flutter/material.dart';


class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<String> shoppingItems = [
    'Milk',
    'Eggs',
    'Bread',
    'Butter',
    'Cheese',
  ];

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Cart is empty'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => _showSnackbar(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: shoppingItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text(shoppingItems[index]),
            );
          },
        ),
      ),
    );
  }
}
