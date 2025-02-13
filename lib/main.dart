import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeHomePage(),
    );
  }
}

class RecipeHomePage extends StatefulWidget {
  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Anne",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            Text("What would you like to cook today?",
                style: TextStyle(color: Colors.black, fontSize: 14)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search any recipes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: [
                _categoryButton(
                    "Breakfast", Icons.free_breakfast, Colors.green),
                _categoryButton("Lunch", Icons.lunch_dining, Colors.orange),
                _categoryButton("Dinner", Icons.dinner_dining, Colors.red),
                _categoryButton("Dessert", Icons.cake, Colors.brown),
              ],
            ),
            SizedBox(height: 20),
            Text("Recommendation",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _recipeCard(
                      "Creamy Pasta", "By David Charles", "assets/pasta.jpg"),
                  _recipeCard(
                      "Macarons", "By Rachel William", "assets/macarons.jpg"),
                  _recipeCard(
                      "Chicken Dish", "By Sam Lee", "assets/chicken.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String text, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(text),
      ],
    );
  }

  Widget _recipeCard(String title, String author, String imagePath) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                width: 120, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(author, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favorites Page")),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Profile Page")),
    );
  }
}
