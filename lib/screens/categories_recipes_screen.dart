import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../components/recipe_item.dart';
import '../models/category.dart';
import '../models/recipe.dart';

class CategoriesRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const CategoriesRecipesScreen(this.recipes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryRecipes = recipes.where((recipe) {
      return recipe.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          category.title,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryRecipes.length,
          itemBuilder: (ctx, index) {
            return RecipeItem(categoryRecipes[index]);
          },
        ),
      ),
    );
  }
}
