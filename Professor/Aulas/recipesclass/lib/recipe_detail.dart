import 'package:flutter/cupertino.dart';
import 'package:recipesclass/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderval = 1;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.recipe.label)),
      child: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(widget.recipe.imgUrl),
            ),
            Text(widget.recipe.label, style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                    "${ingredient.qtd * _sliderval} ${ingredient.mensure} ${ingredient.name}",
                  );
                },
              ),
            ),
            Text("Server quantidade de Pessoas:"),
            CupertinoSlider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _sliderval.toDouble(),
              onChanged: (newValueSlider) {
                setState(() {
                  _sliderval = newValueSlider.round();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
