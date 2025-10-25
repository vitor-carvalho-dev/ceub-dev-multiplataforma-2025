import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardRestaurantComponent extends StatelessWidget {
  final Restaurant restaurant;

  CardRestaurantComponent({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 2,
                child: Stack(
                  children: [
                    Image.network(restaurant.imageUrl, fit: BoxFit.cover),
                    Positioned(
                      top: 4,
                      right: 8,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                  fit: StackFit.expand,
                ),
              ),
            ),
            ListTile(
              title: Text(
                restaurant.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                restaurant.attributes,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => print("Detalhar restaurante"),
            ),
          ],
        ),
      ),
    );
  }
}
