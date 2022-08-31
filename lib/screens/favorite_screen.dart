import 'package:flutter/material.dart';

import '../models/recipe.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoriteScreen({super.key, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Minhas Refeições Favoritas',
      ),
    );
  }
}
