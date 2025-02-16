import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search saved recipes",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Sections de recettes
            SectionWidget(title: "Recently Viewed"),
            RecipeList(),
            SizedBox(height: 20),

            SectionWidget(title: "Made It"),
            RecipeList(),
            SizedBox(height: 20),

            SectionWidget(title: "Breakfast"),
            RecipeList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Widget pour les titres des sections
class SectionWidget extends StatelessWidget {
  final String title;

  SectionWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "See all",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

// Liste horizontale des recettes
class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RecipeCard(image: "assets/recipe1.jpg", text: "32+ Recipes"),
          RecipeCard(image: "assets/recipe2.jpg", text: "10 Recipes"),
        ],
      ),
    );
  }
}

// Carte d'affichage pour une recette
class RecipeCard extends StatelessWidget {
  final String image;
  final String text;

  RecipeCard({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
