import 'package:app/model/categories.dart';
import 'package:flutter/material.dart';

/* CATEGORIAS */
class Categorias extends StatelessWidget {
  const Categorias({
    super.key,
    required this.categories,
    required this.selectCategory,
  });

  final List<Categories> categories;
  final void Function(Categories) selectCategory;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 20),
            // llista de categories
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: ((context, index) {
              return InkWell(
                // widget clicable (detecta el clic)
                onTap: () => selectCategory(
                    categories[index]), // selecciona la categoria
                child: Container(
                  width: screenWidth * 0.2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 240, 206, 178)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(3, 2),
                        ),
                      ],
                      color: Color.fromARGB(255, 230, 180, 63).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            categories[index].img,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(categories[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black)),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
