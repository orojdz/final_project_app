import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Text(
              'Categorias',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      //child: TextField(
      //  controller: _searchController,
      //  decoration: InputDecoration(
      //    hintText: 'Search',
      //    suffixIcon: Icon(Icons.search),
      //    border: OutlineInputBorder(
      //      borderRadius: BorderRadius.circular(25.0),
      //      borderSide: BorderSide.none,
      //    ),
      //    contentPadding: EdgeInsets.all(10.0),
      //    filled: true,
      //    fillColor: Colors.white,
      //  ),
      //  onChanged: (text) {
      //    setState(() {
      //      _searchText = text;
      //    });
      //  },
      //),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
