import 'package:flutter/material.dart';
import '../api/mock_service.dart';
import '../components/categories_components.dart';
import '../components/post_components.dart';
import '../components/restaurants_component.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final MockService _mockService = MockService();
  late Future<ExploreData> _exploreDataFuture;

  bool _initHasError = false;
  String _initErrorMessage = '';

  final Set<String> _favoritedRestaurantIds = {};
  String? _selectedCategoryName;

  void _toggleFavorite(String restaurantId) {
    setState(() {
      if (_favoritedRestaurantIds.contains(restaurantId)) {
        _favoritedRestaurantIds.remove(restaurantId);
      } else {
        _favoritedRestaurantIds.add(restaurantId);
      }
    });
  }

  void _onCategorySelected(String categoryName) {
    setState(() {
      // toque repetido "desmarca" a categoria
      if (_selectedCategoryName == categoryName) {
        _selectedCategoryName = null;
      } else {
        _selectedCategoryName = categoryName;
      }
      print("Categoria selecionada: $_selectedCategoryName");
    });

    // feedback simples
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Categoria: ${_selectedCategoryName ?? "todas"}')),
    );
  }

  @override
  void initState() {
    super.initState();
    try {
      _exploreDataFuture = _mockService.getExploreData();
    } catch (e) {
      setState(() {
        _initHasError = true;
        _initErrorMessage = "Falha ao iniciar a busca de dados: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initHasError) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_initErrorMessage),
        ),
      );
    }

    return FutureBuilder<ExploreData>(
      future: _exploreDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar dados: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final exploreData = snapshot.data!;

          // (Opcional) aplicar filtro simples por nome de categoria no atributo
          final restaurants = _selectedCategoryName == null
              ? exploreData.restaurante
              : exploreData.restaurante
                  .where((r) =>
                      r.attributes.toLowerCase().contains(_selectedCategoryName!.toLowerCase()))
                  .toList();

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: [
              // Restaurantes
              RestaurantComponent(
                restaurants: restaurants,
                favoritedIds: _favoritedRestaurantIds,
                onFavoriteToggle: _toggleFavorite,
              ),
              const SizedBox(height: 24),

              // Categorias
              CategoriesComponent(
                categories: exploreData.categoria,
                onCategoryTap: _onCategorySelected,
              ),
              const SizedBox(height: 24),

              // Posts
              PostsComponent(
                posts: exploreData.friendPost,
              ),
            ],
          );
        } else {
          return const Center(child: Text('Nenhum dado encontrado.'));
        }
      },
    );
  }
}
