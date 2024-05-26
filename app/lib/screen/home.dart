import 'package:flutter/material.dart';
import 'package:app/model/categories.dart';

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
            Categorias(categories: categories),
          ],
        ),
      ),
    );
  }

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

class Categorias extends StatelessWidget {
  const Categorias({
    super.key,
    required this.categories,
  });

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 20),
            // llista de categories
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: ((context, index) {
              return Container(
                width: screenWidth * 0.2,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 180, 63),
                    borderRadius: BorderRadius.circular(16)),
              );
            })),
      ),
    );
  }
}
