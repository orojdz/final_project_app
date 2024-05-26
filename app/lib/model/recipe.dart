// Modelo de clase Recipe
class Recipe {
  final String label;
  final String image;
  final String url;

  Recipe({required this.label, required this.image, required this.url});

  // Método para crear instancias Recipe
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      label: json['label'],
      image: json['image'],
      url: json['url'],
    );
  }
}
