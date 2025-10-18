import 'package:flutter/cupertino.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  double _sliderVal = 1.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.recipe.label),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                widget.recipe.imgUrl,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: CupertinoColors.activeBlue,
                    child: const Icon(CupertinoIcons.photo, size: 48),
                  );
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.recipe.label,
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Ingredientes',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.recipe.ingrediente.map((ingrediente) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• ${(ingrediente.qtd * _sliderVal).toStringAsFixed(1)} ${ingrediente.mensure} de ${ingrediente.name}',
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Porções: ${_sliderVal.toInt()}',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CupertinoSlider(
                  value: _sliderVal,
                  min: 1.0,
                  max: 10.0,
                  divisions: 9,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderVal = newValue;
                    });
                  },
                  activeColor: CupertinoColors.activeBlue,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}