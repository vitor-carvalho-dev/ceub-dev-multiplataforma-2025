import 'package:apprestaurant/components/card_restaurant_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class RestaurantComponent extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantComponent({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Restaurantes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return CardRestaurantComponent(restaurant: restaurants[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
