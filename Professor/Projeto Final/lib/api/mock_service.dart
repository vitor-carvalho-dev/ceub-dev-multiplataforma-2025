import 'dart:convert';

import 'package:apprestaurant/models/models.dart';
import 'package:http/http.dart' as http;

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockService {
  final String _baseUrl = "https://app-restaurant.wiremockapi.cloud";

  Future<ExploreData> getExploreData() async {
    List<Restaurant> restaurants = await _getRestaurants();
    //TODO Criar método getCategories para consultar do endpoint
    List<FoodCategory> categories = []; // /categories
    //TODO Criar método getPost para consultar do endpoint
    List<Post> posts = []; // /posts
    return ExploreData(restaurants, categories, posts);
  }

  Future<List<Restaurant>> _getRestaurants() async {
    final response = await http.get(Uri.parse('$_baseUrl/restaurants'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception("Falha ai carregar os restaurantes");
    }
  }
}
