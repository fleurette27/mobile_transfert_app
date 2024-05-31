// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:mobile_transfert_app/pages/login_screen.dart';
// import 'package:mobile_transfert_app/pages/home.dart';
// import 'package:mobile_transfert_app/model/api_response.dart';
// import 'package:mobile_transfert_app/model/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mobile_transfert_app/services/user_service.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:mobile_transfert_app/theme/color.dart';

// class RegScreen extends StatefulWidget {
//   const RegScreen({super.key});

//   @override
//   State<RegScreen> createState() => _RegScreenState();
// }

// class _RegScreenState extends State<RegScreen> {
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();

//   String phoneNumber = '';
//   void verif() {
//     if (phoneNumber.isEmpty) {
//       // Afficher un message à l'utilisateur pour demander de rentrer d'abord un numéro de téléphone valide
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Veuillez entrer un numéro de téléphone valide.'),
//         ),
//       );
//       return;
//     }
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
//   }

//   bool loading = false;
//   void registerUser() async {
//     ApiResponse response = await register(nameController.text,
//         emailController.text, passwordController.text, phoneNumber);
//     if (response.error == null) {
//       saveAndRedirectToHome(response.data as User);
//     } else {
//       setState(() {
//         loading = !loading;
//       });
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('${response.error}')));
//     }
//   }

//   // Save and redirect to home
//   void saveAndRedirectToHome(User user) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString('token', user.token ?? '');
//     await pref.setInt('userId', user.id ?? 0);
//     // ignore: use_build_context_synchronously
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const Home()),
//         (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context); // Action de retour
//           },
//         ),
//         title: const Text(
//           "Inscription",
//           style: TextStyle(color:white, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor:primary,
//       ),
//       body: SingleChildScrollView(
//           child: Form(
//         key: formkey,
//         child: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                    white,
//                    white
//                 ]),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 60.0, left: 22),
//                 child: Text(
//                   'Créer un compte',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 150.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                   color: Colors.white,
//                 ),
//                 // height:00,
//                 // width: 200,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 18.0, right: 18),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextFormField(
//                         controller: nameController,
//                         validator: (val) => val != nameController.text
//                             ? 'Le champ nom est requis'
//                             : null,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.check,
//                             color: Colors.grey,
//                           ),
//                           labelText: 'Nom complet',
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 58, 184, 23),
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         validator: (val) => val != emailController.text
//                             ? 'Le champs Email est requis'
//                             : null,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.check,
//                             color: Colors.grey,
//                           ),
//                           labelText: 'Email',
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 58, 184, 23),
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         controller: passwordController,
//                         obscureText: true,
//                         validator: (val) => val != passwordController.text
//                             ? 'Le mot de passe est requis et comporte minimun 8 caractere'
//                             : null,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.visibility_off,
//                             color: Colors.grey,
//                           ),
//                           labelText: 'Mot de passe',
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 58, 184, 23),
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         controller: confirmPasswordController,
//                         obscureText: true,
//                         validator: (val) =>
//                             val != confirmPasswordController.text
//                                 ? 'Ce champs est requis '
//                                 : null,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.visibility_off,
//                             color: Colors.grey,
//                           ),
//                           labelText: 'Confirmer le mot de passe',
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 58, 184, 23),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       IntlPhoneField(
//                         controller: phoneNumberController,
//                         initialCountryCode: "BJ",
//                         onChanged: (value) {
//                           setState(() {
//                             phoneNumber = value.completeNumber;
//                           });
//                         },
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey, // Couleur de la bordure
//                               width: 1, // Épaisseur de la bordure
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 15),
//                               backgroundColor: Colors.green,
//                               minimumSize: const Size(100, 0),
//                             ),
//                             onPressed: () {
//                               //Action lorsque le bouton est pressé
//                               if (formkey.currentState!.validate()) {
//                                 setState(() {
//                                   loading = !loading;
//                                   verif();
//                                   registerUser();
//                                 });
//                               }
//                             },
//                             child: loading
//                                 ? const CircularProgressIndicator(
//                                     valueColor:
//                                         AlwaysStoppedAnimation(Colors.white),
//                                   )
//                                 : const Text(
//                                     'S\'inscrire',
//                                     style: TextStyle(
//                                         fontSize: 20, color: Colors.white),
//                                   ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Text.rich(
//                         textAlign: TextAlign.center, // Centrer le texte
//                         TextSpan(
//                           text: "Vous avez déjà un compte ? ",
//                           style: const TextStyle(
//                               fontSize: 16, color: Colors.black),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: 'Connectez-vous',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.green,
//                                 decoration: TextDecoration.underline,
//                               ),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => const LoginScreen(),
//                                     ),
//                                   );
//                                 },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mobile_transfert_app/pages/login_screen.dart';
import 'package:mobile_transfert_app/pages/home.dart';
import 'package:mobile_transfert_app/model/api_response.dart';
import 'package:mobile_transfert_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_transfert_app/services/user_service.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_transfert_app/theme/color.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String phoneNumber = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  bool loading = false;
  void registerUser() async {
    ApiResponse response = await register(nameController.text, emailController.text, passwordController.text, phoneNumber);
    if (response.error == null) {
      saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Save and redirect to home
  void saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Action de retour
          },
        ),
        title: const Text(
          "Inscription",
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(40),
                //   topRight: Radius.circular(40),
                // ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (val) => val != nameController.text ? 'Le champ nom est requis' : null,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: 'Nom complet',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 58, 184, 23),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (val) => val != emailController.text ? 'Le champs Email est requis' : null,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 58, 184, 23),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) => val != passwordController.text ? 'Le mot de passe est requis et comporte minimun 8 caractere' : null,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 58, 184, 23),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (val) => val != confirmPasswordController.text ? 'Ce champs est requis ' : null,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        labelText: 'Confirmer le mot de passe',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 58, 184, 23),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    IntlPhoneField(
                      controller: phoneNumberController,
                      initialCountryCode: "BJ",
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value.completeNumber;
                        });
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // Couleur de la bordure
                            width: 1, // Épaisseur de la bordure
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.green,
                            minimumSize: const Size(100, 0),
                          ),
                          onPressed: () {
                            //Action lorsque le bouton est pressé
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                loading = !loading;
                                registerUser();
                              });
                            }
                          },
                          child: loading
                              ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                              : const Text(
                            'S\'inscrire',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      textAlign: TextAlign.center, // Centrer le texte
                     TextSpan(
                        text: "Vous avez déjà un compte ? ",
                        // ignore: prefer_const_constructors
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Connectez-vous',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer ()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
