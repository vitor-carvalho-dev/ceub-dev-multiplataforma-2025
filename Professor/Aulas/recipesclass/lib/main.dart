import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:recipesclass/recipe.dart';
import 'package:recipesclass/recipe_detail.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Receitas",
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData().copyWith(
        primaryColor: CupertinoColors.activeBlue,
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Livro de Receitas")),
      child: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.mock.length,
          itemBuilder: (context, index) {
            Recipe itemRecipe = Recipe.mock[index];

            //Esse código constroi o item da lista
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return RecipeDetail(recipe: itemRecipe);
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Random(index).nextBool()
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.systemIndigo,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: const [
                    BoxShadow(
                      color: CupertinoColors.systemGrey4,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
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
                      style: TextStyle(
                        fontSize: 20,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
