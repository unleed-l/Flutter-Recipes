import 'package:flutter/material.dart';
import 'package:meals/screens/categories_recipes_screen.dart';
import 'package:meals/screens/recipe_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(RecipesApp());
}

class RecipesApp extends StatelessWidget {
  RecipesApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const CategoriesScreen(),
        AppRoutes.categoriesRecipes: (ctx) => const CategoriesRecipesScreen(),
        AppRoutes.recipeDetail: (ctx) => const RecipeDetailScreen(),
      },
    );
  }
}
