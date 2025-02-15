import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, Anne"),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profil.jpg"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What would you like to cook today?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search any recipes",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.filter_list_rounded),
                    onPressed: () {
                      print("Filter icon tapped");
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory("Breakfast", Icons.free_breakfast),
                  _buildCategory("Lunch", Icons.lunch_dining),
                  _buildCategory("Dinner", Icons.dinner_dining),
                  _buildCategory("Dessert", Icons.cake),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 248, 3, 3)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecipe(
                      "Creamy Pasta",
                      "By David Charles",
                      "assets/pasta.jpg",
                    ),
                    _buildRecipe(
                        "Macarons", "By Rachel William", "assets/macarons.jpg"),
                    _buildRecipe(
                        "Chicken Dish", "By Samuel Cook", "assets/chicken.jpg"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recepe of the week",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 248, 3, 3)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecipe(
                      "Creamy Pasta",
                      "By David Charles",
                      "assets/pasta.jpg",
                    ),
                    _buildRecipe(
                        "Macarons", "By Rachel William", "assets/macarons.jpg"),
                    _buildRecipe(
                        "Chicken Dish", "By Samuel Cook", "assets/chicken.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategory(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildRecipe(String title, String author, String imagePath) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(imagePath,
                width: 150, height: 200, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(author, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
