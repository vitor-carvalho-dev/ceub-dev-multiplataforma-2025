import 'package:flutter/cupertino.dart';
import 'package:recipes/recipe_datails.dart';
import 'recipe.dart';


void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Receitas",
      theme: CupertinoThemeData().copyWith(
          primaryColor: CupertinoColors.activeBlue
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
      navigationBar: CupertinoNavigationBar(
        middle: Text("Livro de receitas")
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: mockRecipes.length,
          itemBuilder: (context, index) {
            final recipe = mockRecipes[index];


            return GestureDetector(

              onTap: () {

                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {

                      return RecipeDetail(recipe: recipe);
                    },
                  ),
                );
              },


              child: CupertinoListSection.insetGrouped(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                children: [
                  CupertinoListTile(

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        recipe.imgUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: CupertinoColors.destructiveRed,
                            child: const Icon(
                              CupertinoIcons.photo,
                              color: CupertinoColors.activeGreen,
                            ),
                          );
                        },
                      ),
                    ),

                    title: Text(recipe.label),
                    trailing: const CupertinoListTileChevron(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}