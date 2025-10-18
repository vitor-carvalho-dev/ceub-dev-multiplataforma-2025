class Recipe {
  final String label;
  final String imgUrl;
  int id;
  List<Ingrediente> ingrediente;

  Recipe(this.label, this.imgUrl, this.id, this.ingrediente);
}

class Ingrediente {
  final double qtd;
  String mensure;
  String name;

  Ingrediente(this.qtd, this.mensure, this.name);
}

final List<Recipe> mockRecipes = [
  Recipe(
    'Bolo de Ninho Fofinho',
    'https://receitatodahora.com.br/wp-content/uploads/2022/08/bolo-de-leite-ninho.jpg',
    1,
    [
      Ingrediente(2, 'xícaras', 'Farinha de Trigo'),
      Ingrediente(1.5, 'xícaras', 'Açúcar'),
      Ingrediente(1, 'xícara', 'Chocolate em Pó'),
      Ingrediente(3, 'unidades', 'Ovos'),
      Ingrediente(1, 'xícara', 'Leite'),
      Ingrediente(0.5, 'xícara', 'Óleo'),
      Ingrediente(1, 'colher de sopa', 'Fermento em Pó'),
    ],
  ),
  Recipe(
    'Frango Xadrez Fácil',
    'https://receitadaboa.com.br/wp-content/uploads/2024/04/iStock-507924203.jpg',
    2,
    [
      Ingrediente(500, 'gramas', 'Peito de Frango em cubos'),
      Ingrediente(1, 'unidade', 'Pimentão Verde'),
      Ingrediente(1, 'unidade', 'Pimentão Vermelho'),
      Ingrediente(1, 'unidade', 'Cebola'),
      Ingrediente(0.25, 'xícara', 'Molho Shoyu'),
      Ingrediente(1, 'colher de sopa', 'Amido de Milho'),
    ],
  ),
  Recipe(
    'Panqueca Americana',
    'https://img-global.cpcdn.com/recipes/c667062f7f96d825/1200x630cq80/photo.jpg', // URL da imagem
    3,
    [
      Ingrediente(1.5, 'xícaras', 'Farinha de Trigo'),
      Ingrediente(2, 'colheres de sopa', 'Açúcar'),
      Ingrediente(2, 'colheres de chá', 'Fermento em Pó'),
      Ingrediente(1, 'pitada', 'Sal'),
      Ingrediente(1.25, 'xícaras', 'Leite'),
      Ingrediente(1, 'unidade', 'Ovo'),
      Ingrediente(3, 'colheres de sopa', 'Manteiga derretida'),
    ],
  ),
];