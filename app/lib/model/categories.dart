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
    categories.add(Categories(name: 'breakfast', img: 'images/breakfast.png'));
    categories.add(Categories(name: 'lunch', img: 'images/lunch.png'));
    categories.add(Categories(name: 'snack', img: 'images/dessert.png'));
    categories.add(Categories(name: 'dinner', img: 'images/dinner.png'));

    return categories;
  }
}
