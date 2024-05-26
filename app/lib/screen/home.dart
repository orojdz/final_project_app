import 'package:app/ui_widgets/categorias.dart';
import 'package:flutter/material.dart';
import 'package:app/model/categories.dart';
import 'package:app/model/recipe.dart';
import 'package:app/data/recipes_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Categories> categories = [];

  void _getCategories() {
    categories = Categories.getCategories(); // obtiene las categorias del model
  }

  // Busca recetas por categoria
  void _getRecipes(Categories category) async {
    String cat = category.name.toString();

    /* Credenciales de la API */
    final String apiId = 'cf541eb7';
    final String apiKey = '43395df6d443797881fe497a0e5d3e74';

    final edamamApi = EdamamApi(appId: apiId, appKey: apiKey);

    try {
      List<Recipe> recipes = await edamamApi.getRecipesByCategory(cat);
      for (var recipe in recipes) {
        print('Recipe: ${recipe.label}, URL: ${recipe.url}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'What are you cooking today?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 233, 130, 50)),
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: _searchInput(),
            ),
            SizedBox(height: 15.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 5.0),
                  child: Text('Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 12.0),
              ],
            ),
            Categorias(categories: categories, selectCategory: _getRecipes),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20.0),
              child: Text('Recommended',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  /* Input text field para buscar */
  TextField _searchInput() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Search recipes',
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30.0))),
    );
  }
}
