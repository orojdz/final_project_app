import 'package:flutter/material.dart';

class MyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My recipes'),
        backgroundColor: Color.fromARGB(213, 235, 193, 95),
      ),
      body: Center(
        child: Text("You haven't created any recipe yet"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Color.fromARGB(255, 232, 7, 7),
          tooltip: 'New recipe',
        ),
      ),
    );
  }
}
