import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_transfert_app/pages/function.dart';
import 'package:mobile_transfert_app/pages/verification_otp.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool loading = false;
  String phoneNumber = '';

  void sendOtpCode() {
    if (phoneNumber.isEmpty) {
      // Afficher un message à l'utilisateur pour demander de rentrer d'abord un numéro de téléphone valide
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer un numéro de téléphone valide.'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    final auth = FirebaseAuth.instance;
    authWithPhoneNumber(phoneNumber, onCodeSend: (verificationId, v) {
      setState(() {
        loading = false;
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (c) => VerificationOtp(
          verificationId: verificationId,
          phoneNumber: phoneNumber,
        ),
      ));
    }, onAutoVerify: (v) async {
      await auth.signInWithCredential(v);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }, onFailed: (e) {
      setState(() {
        loading = false;
      });
      // Afficher un message à l'utilisateur en cas d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Le code est erroné.'),
        ),
      );
    }, autoRetrieval: (v) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Image.asset(
                "images/login1.png", // Chemin vers votre image/logo
                fit: BoxFit.cover,
                width: 200, // Définir la largeur de l'image
                height: 200, // Assurer un ajustement correct de l'image
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
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
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      backgroundColor: Colors.green, // Arrière-plan vert
                      minimumSize:
                          const Size(100, 0), // Largeur minimale du bouton
                    ),
                    onPressed: loading ? null : sendOtpCode,
                    child: loading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Text(
                            'Se connecter',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white), // Texte blanc
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
