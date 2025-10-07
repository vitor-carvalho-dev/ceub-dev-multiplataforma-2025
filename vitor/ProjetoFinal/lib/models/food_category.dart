class FoodCategory {
  String name;
  int numberOfRestaurants;
  String imageUrl;

  FoodCategory(
    this.name,
    this.numberOfRestaurants,
    this.imageUrl,
  );

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      json['name'] as String,
      json['numberOfRestaurants'] as int,
      json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numberOfRestaurants': numberOfRestaurants,
      'imageUrl': imageUrl,
    };
  }
}
