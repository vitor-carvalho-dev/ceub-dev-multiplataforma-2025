import 'dart:convert';
import 'package:projetofinal/models/food_category.dart';
import 'package:projetofinal/models/models.dart';
import 'package:http/http.dart' as http;


class ExploreData {
  final List<Restaurant> restaurante;
  final List<FoodCategory> categoria;
  final List<Post> friendPost;

  ExploreData(this.restaurante, this.categoria, this.friendPost);
}

class MockService {
  final String _baseUrl = "https://app-restaurant.wiremockapi.cloud";

  Future<ExploreData> getExploreData() async {
    try {
      final results = await Future.wait([
        getRestaurants(),
        getCategories(),
        getFriendPosts(),
      ]);

      List<Restaurant> restaurants = await getRestaurants();
      List<FoodCategory> categories = [];
      List<Post> posts = [];

      return ExploreData(restaurants, categories, posts);
    } catch (e) {
      throw Exception("Falha ao carregar os dados da página Explorar: $e");
    }
  }

  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse('$_baseUrl/restaurants'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Restaurant.fromJson(e),).toList();
    } else {
      throw Exception("fallha ao carregar os restaurantes");
    }
  }

  Future<List<FoodCategory>> getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => FoodCategory.fromJson(e)).toList();
    } else {
      throw Exception("Falha ao carregar as categorias");
    }
  }

  Future<List<Post>> getFriendPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception("Falha ao carregar os posts");
    }
  }
}