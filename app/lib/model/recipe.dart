// Modelo de clase Recipe
class Recipe {
  final String label;
  final String image;
  final String url;

  Recipe({required this.label, required this.image, required this.url});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      label: json['label'],
      image: json['image'],
      url: json['url'],
    );
  }
}
