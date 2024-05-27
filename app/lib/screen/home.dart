import 'package:app/ui_widgets/categorias.dart';
import 'package:flutter/material.dart';
import 'package:app/model/categories.dart';
import 'package:app/model/recipe.dart';
import 'package:app/data/recipes_data.dart';
import 'package:app/ui_widgets/recipes_card.dart';
import 'package:app/screen/my_recipes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Categories> categories = [];
  Future<List<Recipe>>? _recipes;

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    categories = Categories.getCategories(); // obtiene las categorias del model
  }

  // Busca recetas por categoria
  Future<List<Recipe>> _getRecipes(Categories category) async {
    String cat = category.name.toString();

    /* Credenciales de la API */
    final String apiId = 'cf541eb7';
    final String apiKey = '43395df6d443797881fe497a0e5d3e74';

    final edamamApi = EdamamApi(appId: apiId, appKey: apiKey);

    try {
      List<Recipe> recipes = await edamamApi.getRecipesByCategory(cat);
      return recipes;
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }

  // Busca recetas por el input
  Future<List<Recipe>> _searchRecipes(String query) async {
    /* Credenciales de la API */
    final String apiId = 'cf541eb7';
    final String apiKey = '43395df6d443797881fe497a0e5d3e74';

    final edamamApi = EdamamApi(appId: apiId, appKey: apiKey);

    try {
      List<Recipe> recipes = await edamamApi.getRecipesByQuery(query);
      return recipes;
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
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
            SizedBox(height: 10.0),
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
            Categorias(
                categories: categories,
                selectCategory: (category) {
                  setState(() {
                    _recipes = _getRecipes(category);
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20.0),
              child: Text('Recommended',
                  style: TextStyle(
                      color: Color.fromARGB(255, 186, 51, 13),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 14),
            RecipesContainerWidget(),
          ],
        ),
      ),
      bottomNavigationBar: navigationBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyRecipes()),
            );
          },
          tooltip: 'Create new',
          elevation: 0.0,
          child: const Icon(Icons.edit)),
    );
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      // indice actual
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      backgroundColor: Color.fromARGB(213, 235, 193, 95),
      elevation: 0,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 239, 158, 82),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Color.fromARGB(255, 239, 158, 82),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.cookie,
            color: Color.fromARGB(255, 239, 158, 82),
          ),
          label: 'My recipes',
        ),
      ],
    );
  }

  /* Widget que contiene un FutureBuilder que recibe y gestiona la lista de recetas */
  Container RecipesContainerWidget() {
    return Container(
      child: FutureBuilder<List<Recipe>>(
        future: _recipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Sorry, something unexpected happened! :('));
          } else if (snapshot.hasData) {
            return _buildRecipeList(snapshot.data!);
          } else {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Tap on a category to search recipes',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        'images/cooking-1.png',
                        fit: BoxFit.contain,
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }

  /* Construye la lista de recetas */
  Widget _buildRecipeList(List<Recipe> recipes) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: RecipeCard(recipe: recipe),
        );
      },
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
        onSubmitted: (value) => {
              setState(() {
                _recipes = _searchRecipes(value);
              })
            });
  }
}
