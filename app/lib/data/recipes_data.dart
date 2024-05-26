import 'dart:convert';
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

  Future<List<Recipe>> getRecipesByCategory(String category) async {
    final url =
        Uri.parse('$baseUrl/search?q=$category&app_id=$appId&app_key=$appKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> hits = data['hits'];
      return hits.map((hit) => Recipe.fromJson(hit['recipe'])).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
