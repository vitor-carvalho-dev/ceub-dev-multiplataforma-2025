class Item {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Item({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

class Restaurant {
  String id;
  String name;
  String address;
  String attributes;
  String imageUrl;
  String imageCredits;
  double distance;
  double rating;
  List<Item> items;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.attributes,
    required this.imageUrl,
    required this.imageCredits,
    required this.distance,
    required this.rating,
    required this.items,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      attributes: json['attributes'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      imageCredits: json['imageCredits'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      items: (json['items'] as List<dynamic>?)?.map((e) => Item.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'attributes': attributes,
      'imageUrl': imageUrl,
      'imageCredits': imageCredits,
      'distance': distance,
      'rating': rating,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  String getRatingAndDistance() {
    return '''Rating: ${rating.toStringAsFixed(1)} ★ | Distance: ${distance.toStringAsFixed(1)} miles''';
  }
}
