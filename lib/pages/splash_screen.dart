import 'package:flutter/material.dart';
import 'sign_in.dart'; // Importez la page de sign-in ici

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100), // Espace pour le titre
          const Text(
            "Bienvenue dans SeedPay",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 20), // Espace pour le logo
          Image.asset(
            "images/login4.jpg", // Chemin vers votre image/logo
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 20), // Espace pour la phrase d'accroche
          SizedBox(
            height: 100, // Hauteur fixe pour le défilement de phrases
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                _buildPhrase("Transférez de l'argent en toute sécurité", color:const Color.fromARGB(255, 63, 194, 58)),
                _buildPhrase("Envoyez de l'argent rapidement et facilement", color:const Color.fromARGB(255, 63, 194, 58)),
                _buildPhrase("SeedPay : la solution idéale pour vos transactions financières", color:const Color.fromARGB(255, 63, 194, 58)),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espace pour le bouton
          ElevatedButton(
            onPressed: () {
              // Navigation vers la page de sign-in
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInView()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Couleur du bouton
            ),
            child: const Text("Commencer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildPhrase(String phrase, {Color color = Colors.green}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        phrase,
        style: TextStyle(fontSize: 16, color: color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
