// import 'package:flutter/material.dart';
// import 'package:mobile_transfert_app/theme/color.dart';

// class UserAccount extends StatefulWidget {
//   const UserAccount({super.key});

//   @override
//   State<UserAccount> createState() => _UserAccountState();
// }

// class _UserAccountState extends State<UserAccount> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context); // Action de retour
//           },
//         ),),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//            const Icon(Icons.account_circle,color: primary,),
//             const SizedBox(height: 20),
//             itemProfile('Name', 'ABC', Icons.person),
//             const SizedBox(height: 10),
//             itemProfile('Phone', '03107085816', Icons.phone),
//             const SizedBox(height: 10),
//             itemProfile('Email', 'Fleur@gmail.com', Icons.mail),
//             const SizedBox(height: 20,),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: const Text('Modifier votre Profile')
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   itemProfile(String title, String subtitle, IconData iconData) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(0, 5),
//                 color: Colors.deepOrange.withOpacity(.2),
//                 spreadRadius: 2,
//                 blurRadius: 10
//             )
//           ]
//       ),
//       child: ListTile(
//         title: Text(title),
//         subtitle: Text(subtitle),
//         leading: Icon(iconData),
//         trailing:  IconButton(
//          onPressed: () {
//           //  Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (context) => const ),
//           //     );
//         },
//         icon: const Icon(Icons.edit,color: primary,),
//       ),
//         tileColor: Colors.white,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_transfert_app/constant.dart';
import 'package:mobile_transfert_app/model/api_response.dart';
import 'package:mobile_transfert_app/model/user.dart';
import 'package:mobile_transfert_app/pages/sign_in.dart';
import 'package:mobile_transfert_app/services/user_service.dart';
import 'package:mobile_transfert_app/theme/color.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String? nameController;
  String? emailController;
  String? passwordController;
  String? phoneNumberController;

  User? user;

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        nameController = user!.name ?? '';
        emailController = user!.email ?? '';
        phoneNumberController = user!.phoneNumber ?? '';
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignInView()),
                (route) => false)
          });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
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
          "Information du compte",
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.account_circle, color: primary),
            const SizedBox(height: 20),
            itemProfile('Nom et prenom', nameController, Icons.person, () {
              // Action de modification pour le nom
              showEditNameForm(); // Appel de la fonction pour afficher le formulaire d'édition
            }),
            const SizedBox(height: 10),
            itemProfile('Email', emailController, Icons.mail, () {
              // Action de modification pour l'email
              showEditEmailForm(); // Appel de la fonction pour afficher le formulaire d'édition
            }),
            const SizedBox(height: 10),
            itemProfile('Phone', phoneNumberController, Icons.phone, () {
              // Action de modification pour le numéro de téléphone
              showEditPhoneNumberForm(); // Appel de la fonction pour afficher le formulaire d'édition
            }),
            const SizedBox(height: 10),
            itemProfile('Mot de passe', '***********', Icons.emergency_rounded,
                () {
              // Action de modification pour le numéro de téléphone
              showEditPasswordForm(); // Appel de la fonction pour afficher le formulaire d'édition
            }),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, String? subtitle, IconData iconData,
      VoidCallback onEditPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: const Color.fromRGBO(51, 105, 30, 1).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle!),
        leading: Icon(iconData),
        trailing: IconButton(
          onPressed: onEditPressed,
          icon: const Icon(Icons.edit, color: primary),
        ),
        tileColor: Colors.white,
      ),
    );
  }

  void showEditNameForm() {
    TextEditingController nameController = TextEditingController();

    void editName() async {
      int id = await getUserId();

      ApiResponse response = await updateName(id, nameController.text);

      if (response.error == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.data}')));
      } else if (response.error == unauthorized) {
        logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignInView()),
                  (route) => false)
            });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Spécifier que la page modale est contrôlée par le scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Modifier',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller:
                    nameController, // Assigner le contrôleur au champ de texte
                decoration: const InputDecoration(labelText: 'Nouvelle valeur'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                  minimumSize: const Size(100, 0),
                ),
                onPressed: () {
                  editName();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Valider',
                  style: TextStyle(color: white),
                ),
              ),
            ],
          ),
          
            
          
        );
      },
    );
  }

  void showEditEmailForm() {
    TextEditingController emailController = TextEditingController();

    void editEmail() async {
      int id = await getUserId();

      ApiResponse response = await updateEmail(id, emailController.text);

      if (response.error == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.data}')));
      } else if (response.error == unauthorized) {
        logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignInView()),
                  (route) => false)
            });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Spécifier que la page modale est contrôlée par le scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Modifier',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  controller:
                      emailController, // Assigner le contrôleur au champ de texte
                  decoration: const InputDecoration(labelText: 'Nouvelle valeur'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green,
                    minimumSize: const Size(100, 0),
                  ),
                  onPressed: () {
                    editEmail();
                    Navigator.pop(
                        context); // Fermer la page d'édition après validation
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showEditPhoneNumberForm() {
    TextEditingController phoneNumberController = TextEditingController();

    void editPhoneNumber() async {
      int id = await getUserId();

      ApiResponse response =
          await updatePhoneNumber(id, phoneNumberController.text);

      if (response.error == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.data}')));
      } else if (response.error == unauthorized) {
        logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignInView()),
                  (route) => false)
            });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Spécifier que la page modale est contrôlée par le scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Modifier',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  controller:
                      phoneNumberController, // Assigner le contrôleur au champ de texte
                  decoration: const InputDecoration(labelText: 'Nouvelle valeur'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green,
                    minimumSize: const Size(100, 0),
                  ),
                  onPressed: () {
                    editPhoneNumber();
                    Navigator.pop(
                        context); // Fermer la page d'édition après validation
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showEditPasswordForm() {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController newPasswordConfirmationController =
        TextEditingController();

    void editPassword() async {
      int id = await getUserId();

      ApiResponse response = await updatePassword(
          id,
          currentPasswordController.text,
          newPasswordController.text,
          newPasswordConfirmationController.text);

      if (response.error == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.data}')));
      } else if (response.error == unauthorized) {
        logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignInView()),
                  (route) => false)
            });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Spécifier que la page modale est contrôlée par le scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Modifier',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  controller:
                      currentPasswordController, // Assigner le contrôleur au champ de texte
                  decoration: const InputDecoration(labelText: 'Ancien mot de passe'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller:
                      newPasswordController, // Assigner le contrôleur au champ de texte
                  decoration: const InputDecoration(labelText: 'Nouveau mot de passe'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller:
                      newPasswordConfirmationController, // Assigner le contrôleur au champ de texte
                  decoration: const InputDecoration(labelText: 'Confirmer le mot de passe'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green,
                    minimumSize: const Size(100, 0),
                  ),
                  onPressed: () {
                    editPassword();
                    Navigator.pop(
                        context); // Fermer la page d'édition après validation
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
