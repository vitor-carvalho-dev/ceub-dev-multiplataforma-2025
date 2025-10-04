import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                widget.recipe.imgUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.grey, size: 48),
                  );
                },
              ),

              const SizedBox(height: 16),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.recipe.label,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Ingredientes',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
                        style: const TextStyle(fontSize: 16),
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Slider(
                value: _sliderVal,
                min: 1.0,
                max: 10.0,
                divisions: 9,
                label: _sliderVal.toInt().toString(),
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.blueAccent.shade100,

                onChanged: (newValue) {
                  setState(() {

                    _sliderVal = newValue;
                  });
                },


              ),
            ],
          ),
        ),
      ),
    );
  }
}