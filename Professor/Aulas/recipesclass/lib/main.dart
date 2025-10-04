import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipesclass/recipe.dart';
import 'package:recipesclass/recipe_detail.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receitas",
      debugShowCheckedModeBanner: true,
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Livro de Receitas"), elevation: 8),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.mock.length,
          itemBuilder: (context, index) {
            Recipe itemRecipe = Recipe.mock[index];

            //Esse código constroi o item da lista
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetail(recipe: itemRecipe);
                    },
                  ),
                );
              },
              child: Card(
                color: Random(index).nextBool() ? Colors.purple : Colors.blue,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image.network(itemRecipe.imgUrl),
                      ),
                      Text(
                        itemRecipe.label,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
