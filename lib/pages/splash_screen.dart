import 'package:flutter/material.dart';
// import 'package:mobile_transfert_app/pages/reg_screen.dart';
import 'package:mobile_transfert_app/pages/sign_in.dart';
import 'package:mobile_transfert_app/theme/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       body: Column(
//         children: [
//           const SizedBox(height: 100), // Espace pour le titre
//           const Text(
//             "Bienvenue dans SeedPay",
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
//           ),
//           const SizedBox(height: 20), // Espace pour le logo
//           Image.asset(
//             "images/login4.jpg", // Chemin vers votre image/logo
//             width: 250,
//             height: 250,
//           ),
//           const SizedBox(height: 20), // Espace pour la phrase d'accroche
//           SizedBox(
//             height: 100, // Hauteur fixe pour le défilement de phrases
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: [
//                 _buildPhrase("Transférez de l'argent en toute sécurité", color:const Color.fromARGB(255, 63, 194, 58)),
//                 _buildPhrase("Envoyez de l'argent rapidement et facilement", color:const Color.fromARGB(255, 63, 194, 58)),
//                 _buildPhrase("SeedPay : la solution idéale pour vos transactions financières", color:const Color.fromARGB(255, 63, 194, 58)),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20), // Espace pour les boutons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigation vers la page de sign-in
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignInView()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.lightGreen[900], // Couleur du bouton
//                 ),
//                 child: const Text("Se connecter", style: TextStyle(color: Colors.white)),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigation vers la page d'inscription
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const RegScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.lightGreen[900], // Couleur du bouton
//                 ),
//                 child: const Text("S'inscrire", style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPhrase(String phrase, {Color color = Colors.green}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Text(
//         phrase,
//         style: TextStyle(fontSize: 16, color: color),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/welcom.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 350),
                // Titre
                Text(
                  "SeedPay",
                   textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                // Sous-titre
                const SizedBox(height: 20),
                Text(
                  "SeedPay : la solution idéale pour vos transactions financières",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green.shade900,
                  ),
                ),
                // Espacement
                const SizedBox(height: 50),

                // Boutons
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Action lorsque le premier bouton est appuyé
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInView()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: secondary, // Fond transparent
                        side: const BorderSide(
                            color: secondary), // Bordure du bouton
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15), // Espacement interne
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10)), // Forme du bouton
                      ),
                      child:  const Text(
                        "Commencer",
                        style: TextStyle(fontSize: 16,color: white,),
                      ),
                    ),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     // Action lorsque le deuxième bouton est appuyé
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const RegScreen()),
                    //     );
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     backgroundColor: primary, // Fond transparent
                    //     side: const BorderSide(
                    //         color: primary), // Bordure du bouton
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 20, vertical: 15), // Espacement interne
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(10)), // Forme du bouton
                    //   ),
                    //   child: const Text(
                    //     "S'Inscrire",
                    //     style: TextStyle(fontSize: 16,color: white),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
