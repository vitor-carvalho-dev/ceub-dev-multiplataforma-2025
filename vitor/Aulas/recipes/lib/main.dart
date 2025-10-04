import 'package:flutter/material.dart';
import 'package:recipes/recipe_datails.dart';
import 'recipe.dart';


void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receitas",
      theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)
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
      appBar: AppBar(
        title: Text("Livro de receitas"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: mockRecipes.length,
          itemBuilder: (context, index) {
            final recipe = mockRecipes[index];


            return InkWell(

              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {

                      return RecipeDetail(recipe: recipe);
                    },
                  ),
                );
              },

              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      recipe.imgUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.blueAccent[300],
                          child: const Icon(Icons.broken_image,
                              color: Colors.deepOrangeAccent, size: 48),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      child: Text(
                        recipe.label,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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