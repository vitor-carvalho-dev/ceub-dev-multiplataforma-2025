import 'package:flutter/material.dart';
import 'package:projetofinal/models/models.dart';

class RestaurantComponent extends StatelessWidget {
  final List<Restaurant> restaurants;

  final Set<String> favoritedIds;
  final Function(String) onFavoriteToggle;

  const RestaurantComponent({
    super.key,
    required this.restaurants,
    required this.favoritedIds,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Text(
            "Restaurantes",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              final bool isFavorited = favoritedIds.contains(restaurant.id);

              return SizedBox(
                width: 250,
                child: Card(
                  margin: const EdgeInsets.only(right: 12),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              restaurant.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: IconButton(

                                onPressed: () => onFavoriteToggle(restaurant.id),

                                icon: Icon(
                                  isFavorited ? Icons.favorite : Icons.favorite_border,
                                ),
                                iconSize: 30,
                                color: isFavorited ? Colors.red : Colors.white,
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.3)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(restaurant.name),
                        subtitle: Text(
                          restaurant.attributes,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () => print("Detalhar restaurante: ${restaurant.name}"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}