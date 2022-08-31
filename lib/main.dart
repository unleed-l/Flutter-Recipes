import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories_recipes_screen.dart';
import 'package:meals/screens/recipe_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'models/filters.dart';
import 'models/recipe.dart';
import 'utils/app_routes.dart';

void main() => runApp(const RecipesApp());

class RecipesApp extends StatefulWidget {
  const RecipesApp({Key? key}) : super(key: key);

  @override
  State<RecipesApp> createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  final ThemeData theme = ThemeData();
  Filters filters = Filters();
  List<Recipe> _availableRecipes = dummyRecipes;
  List<Recipe> _favoriteRecipes = [];

  void _filterRecipes(Filters filters) {
    setState(
      () {
        this.filters = filters;
        _availableRecipes = dummyRecipes.where((recipe) {
          final filterGluten = filters.isGlutenFree && !recipe.isGlutenFree;
          final filterLactose = filters.isLactoseFree && !recipe.isLactoseFree;
          final filterVegan = filters.isVegan && !recipe.isVegan;
          final filterVegetarian = filters.isVegetarian && !recipe.isVegetarian;

          return !filterGluten &&
              !filterLactose &&
              !filterVegan &&
              !filterVegetarian;
        }).toList();
      },
    );

    void _toggleFavorite(Recipe recipe) {
      setState(
        () {
          _favoriteRecipes.contains(recipe)
              ? _favoriteRecipes.remove(recipe)
              : _favoriteRecipes.add(recipe);
        },
      );
    }
  }

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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(favoriteRecipes: _favoriteRecipes),
        AppRoutes.categoriesRecipes: (ctx) =>
            CategoriesRecipesScreen(_availableRecipes),
        AppRoutes.recipeDetail: (ctx) =>
            RecipeDetailScreen(onFavorite: _toggleFavorite(recipe)),
        AppRoutes.settings: (ctx) => SettingsScreen(
              filters: filters,
              onFiltersChanged: _filterRecipes,
            ),
      },
    );
  }
}
