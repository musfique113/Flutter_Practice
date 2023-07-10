import 'dart:convert';

import 'package:flutter/material.dart';

import 'model.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> recipes;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final jsonString =
        await rootBundle.loadString('assets/api/recipe-ostad-modulenine.json');
    final jsonData = json.decode(jsonString);
    final recipeList = jsonData['recipes'] as List<dynamic>;
    recipes = recipeList.map((json) => Recipe.fromJson(json)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: recipes != null
          ? ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: Padding(
              padding: EdgeInsets.only(right: 8.0), // Example padding value
              child: Icon(Icons.fastfood), // Example icon on the left side
            ),
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            onTap: () {

            },
          );
        },
      )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
