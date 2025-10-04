class Recipe {
  final String label;
  final String imgUrl;
  int id;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imgUrl, this.id, this.ingredients);

  static List<Recipe> mock = [
    Recipe(
      'Spaghetti e almôndegas',
      'https://cdn0.tudoreceitas.com/pt/posts/7/9/9/almondegas_com_farinha_integral_4997_600.jpg',
      1,
      [
        Ingredient(1, 'caixa', 'Spaghetti'),
        Ingredient(4, '', 'Almôndegas de carne congeladas'),
        Ingredient(0.5, 'pote', 'molho de tomate'),
      ],
    ),
    Recipe(
      'Sopa de tomate',
      'https://assets.unileversolutions.com/recipes-v2/36850.jpg',
      2,
      [Ingredient(1, 'lata', 'Sopa de Tomate')],
    ),
    Recipe(
      'Sanduíche de queijo quente',
      'https://www.estadao.com.br/resizer/v2/WI4MFMENKRCNTAHKETWKD75NPY.jpg?quality=80&auth=8a644666b9693e001753a1c9a0354adc8ad0eccc0adeda95f38adc5d3d3da072&width=550&height=375&focal=2750,2010',
      3,
      [Ingredient(2, 'fatias', 'Queijo'), Ingredient(2, 'fatias', 'Pão')],
    ),
    Recipe(
      'Tacos',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg/1200px-001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg',
      4,
      [Ingredient(0.5, 'kg', 'carne moída')],
    ),
  ];
}

class Ingredient {
  final double qtd;
  String mensure;
  String name;

  Ingredient(this.qtd, this.mensure, this.name);
}
