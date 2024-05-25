// Modelo básico para el widget categorias
class Categories {
  final String name;
  final String img;

  Categories({
    required this.name,
    required this.img,
  });

  static List<Categories> getCategories() {
    List<Categories> categories = [];

    // Todas las categorias
    categories.add(Categories(name: 'Breakfast', img: 'images/breakfast.png'));
    categories.add(Categories(name: 'Lunch', img: 'images/lunch.png'));
    categories.add(Categories(name: 'Desserts', img: 'images/dessert.png'));
    categories.add(Categories(name: 'Dinner', img: 'images/dinner'));

    return categories;
  }
}
