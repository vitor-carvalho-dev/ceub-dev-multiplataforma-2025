import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ExploreData {
  final List<Restaurant> restaurante;
  final List<FoodCategory> categoria;
  final List<Post> friendPost;

  ExploreData(this.restaurante, this.categoria, this.friendPost);
}

class MockService {
  final String _baseUrl = 'https://app-restaurant.wiremockapi.cloud';

  Future<List<Restaurant>> getRestaurants() async {
    final res = await http.get(Uri.parse('$_baseUrl/restaurants'));
    if (res.statusCode != 200) {
      throw Exception('Falha ao carregar restaurantes');
    }
    final list = (jsonDecode(res.body) as List);
    return list.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<List<FoodCategory>> getCategories() async {
    final res = await http.get(Uri.parse('$_baseUrl/categories'));
    if (res.statusCode != 200) {
      throw Exception('Falha ao carregar categorias');
    }
    final list = (jsonDecode(res.body) as List);
    return list.map((e) => FoodCategory.fromJson(e)).toList();
  }

  Future<List<Post>> getFriendPosts() async {
    final res = await http.get(Uri.parse('$_baseUrl/posts'));
    if (res.statusCode != 200) {
      throw Exception('Falha ao carregar posts');
    }
    final list = (jsonDecode(res.body) as List);
    return list.map((e) => Post.fromJson(e)).toList();
  }

  /// Agrega dados para a ExplorePage
  Future<ExploreData> getExploreData() async {
    final results = await Future.wait([
      getRestaurants(),
      getCategories(),
      getFriendPosts(),
    ]);

    return ExploreData(
      results[0] as List<Restaurant>,
      results[1] as List<FoodCategory>,
      results[2] as List<Post>,
    );
  }
}
