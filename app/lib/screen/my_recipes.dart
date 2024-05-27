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
          onPressed: () {
            _displayFormSheet(context);
          },
          icon: Icon(Icons.add),
          color: Color.fromARGB(255, 232, 7, 7),
          tooltip: 'New recipe',
        ),
      ),
    );
  }

  Future _displayFormSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Create a new recipe',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 208, 87, 12)),
                ),
                trailing: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
