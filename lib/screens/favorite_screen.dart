import 'package:flutter/material.dart';
import 'package:meals/components/recipe_item.dart';
import '../models/recipe.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  const FavoriteScreen(this.favoriteRecipes, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteRecipes.isEmpty
        ? const Center(
            child: Text(
              'Nenhuma Refeição favorita!',
            ),
          )
        : ListView.builder(
            itemCount: favoriteRecipes.length,
            itemBuilder: (ctx, index) {
              return RecipeItem(favoriteRecipes[index]);
            },
          );
  }
}
