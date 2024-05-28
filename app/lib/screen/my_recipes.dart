import 'package:flutter/material.dart';
import 'package:app/model/recipe.dart';
import 'package:app/ui_widgets/recipes_card.dart';
import 'package:app/data/recipes_data.dart';

class MyRecipes extends StatefulWidget {
  MyRecipes({super.key});

  @override
  _MyRecipesState createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  List<Recipe> newRecipes = [];

  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  final _formKey = GlobalKey<FormState>();

  // instacia de la clase que gestiona la collection de firebase
  final FirebaseService _firebaseService = FirebaseService();

  // set State para añadir nuevas recetas a la lista de recetas
  void _addRecipe(Recipe recipe) {
    setState(() {
      newRecipes.add(recipe);
    });
  }

  // Obtiene las recetas de la collection firebase
  void _getRecipes() async {
    // método de la clase FirebaseServices
    newRecipes = await _firebaseService.getRecipes();
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My recipes'),
        backgroundColor: Color.fromARGB(213, 235, 193, 95),
      ),
      body: FutureBuilder<List<Recipe>>(
          future: _firebaseService.getRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Sorry, something unexpected happened! :('));
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("You haven't created any recipe yet"),
              );
            } else {
              return SingleChildScrollView(
                  child: _buildRecipeList(snapshot.data!));
            }
          }),
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

  /* Construye la lista de recetas */
  Widget _buildRecipeList(List<Recipe> recipes) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: RecipeCard(recipe: recipe),
        );
      },
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
                selectedColor: Colors.white,
                trailing: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              CreateRecipeForm(
                formKey: _formKey,
                onRecipeAdded: _addRecipe,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreateRecipeForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(Recipe) onRecipeAdded;

  const CreateRecipeForm(
      {Key? key, required this.formKey, required this.onRecipeAdded})
      : super(key: key);

  @override
  _CreateRecipeFormState createState() => _CreateRecipeFormState();
}

class _CreateRecipeFormState extends State<CreateRecipeForm> {
  // Controllers del input de los formularios
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Camp obligatori!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Image(url)"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Camp obligatori';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget.formKey.currentState!.validate()) {
                      Recipe newRecipe = Recipe(
                        label: _titleController.text,
                        image: _imageController.text,
                        url: '',
                      );
                      await _firebaseService.addRecipe(newRecipe);
                      widget.onRecipeAdded(newRecipe);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 239, 145, 73)),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
