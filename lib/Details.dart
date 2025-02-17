import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product details"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("Receive product details for better preparation"),
              const SizedBox(height: 10),

              // Image principale
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/macarons.jpg', // Remplace par ton image
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Titre + Note
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choco Macarons",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text("By Rachel William",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text("4.5",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Infos recette
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RecipeInfo(icon: Icons.access_time, text: "10 mins"),
                  RecipeInfo(icon: Icons.signal_cellular_alt, text: "Medium"),
                  RecipeInfo(
                      icon: Icons.local_fire_department, text: "512 cal"),
                ],
              ),
              const SizedBox(height: 20),

              // Description
              const Text(
                "Chocolate is the best kind of dessert! These choco macarons are simply heavenly! "
                "Delicate little cookies filled with chocolate ganache.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Ingrédients
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Liste d'ingrédients
              Column(
                children: const [
                  IngredientItem(name: "Granulated sugar", quantity: "160 g"),
                  IngredientItem(name: "Ground almond", quantity: "160 g"),
                  IngredientItem(name: "Dark chocolate", quantity: "110 g"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget pour un ingrédient
class IngredientItem extends StatelessWidget {
  final String name;
  final String quantity;

  const IngredientItem({required this.name, required this.quantity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.food_bank, color: Colors.black54),
              ),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontSize: 16)),
            ],
          ),
          Text(quantity,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Widget pour afficher les infos de la recette (Temps, Difficulté, Calories)
class RecipeInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const RecipeInfo({required this.icon, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
