import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:app/model/recipe.dart';

// Clase para gestionar las peticiones a la API Edamam
class EdamamApi {
  final String appId;
  final String appKey;
  final String baseUrl;

  EdamamApi(
      {required this.appId,
      required this.appKey,
      this.baseUrl = 'https://api.edamam.com'});

  // Función que recibe un parámetro y devuelve una lista de recetas.
  Future<List<Recipe>> getRecipesByCategory(String category) async {
    // parametros de la URL
    final queryParameters = {
      'q': category,
      'app_id': appId,
      'app_key': appKey,
    };

    final url =
        Uri.parse('$baseUrl/search').replace(queryParameters: queryParameters);

    final response = await http.get(url); // petición get recipes

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Los objetos hits tienen el campo 'recipe'
      final List<dynamic> hits = data['hits'];
      // Devuelve una lista de recetas
      return hits.map((hit) => Recipe.fromJson(hit['recipe'])).toList();
    } else {
      throw Exception('Failed to load recipes from edamam');
    }
  }

  // Método para busqueda general
  Future<List<Recipe>> getRecipesByQuery(String query) async {
    return getRecipesByCategory(query);
  }
}

/* Gestión backend firebase */
class FirebaseService {
  final CollectionReference recipedb =
      FirebaseFirestore.instance.collection('myrecipes');

  // Función future void para añadir nuevas recetas a la collection
  Future<void> addRecipe(Recipe recipe) {
    return recipedb.add({
      'label': recipe.label,
      'image': recipe.image,
      'url': recipe.url,
    });
  }

  // Devuelve lista de recetas de la collection de Firebase
  Future<List<Recipe>> getRecipes() async {
    // objeto que contiene el resultado de la Query GET
    QuerySnapshot snapshot = await recipedb.get();
    // lista de los documentos en firebase
    return snapshot.docs.map((doc) {
      return Recipe(
        label: doc['label'], // doc get el valor 'label'
        image: doc['image'],
        url: doc['url'],
      );
    }).toList();
  }
}
