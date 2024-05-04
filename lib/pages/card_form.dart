

// // import 'package:flutter/material.dart';
// // import 'package:flutter_credit_card/flutter_credit_card.dart';
// // import 'package:mobile_transfert_app/theme/color.dart';

// // class CardForm extends StatefulWidget {
// //   const CardForm({super.key});

// //   @override
// //   State<CardForm> createState() => _CardFormState();
// // }

// // class _CardFormState extends State<CardForm> {
// //   String cardNumber = '';
// //   String expiryDate = '';
// //   String cardHolderName = '';
// //   String cvvCode = '';
// //   bool isCvvFocused = false;
// //   bool useGlassMorphism = false;
// //   bool useBackgroundImage = false;
// //   bool useFloatingAnimation = true;
// //   final OutlineInputBorder border = OutlineInputBorder(
// //     borderSide: BorderSide(
// //       color: Colors.grey.withOpacity(0.7),
// //       width: 2.0,
// //     ),
// //   );
// //   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       body: Builder(
// //         builder: (BuildContext context) {
// //           return Container(
// //             color: Colors.white,
// //             child: SafeArea(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: <Widget>[
// //                   CreditCardWidget(
// //                     enableFloatingCard: useFloatingAnimation,
// //                     glassmorphismConfig: _getGlassmorphismConfig(),
// //                     cardNumber: cardNumber,
// //                     expiryDate: expiryDate,
// //                     cardHolderName: cardHolderName,
// //                     cvvCode: cvvCode,
// //                     bankName: 'SeedPay',
// //                     frontCardBorder: useGlassMorphism
// //                         ? null
// //                         : Border.all(color: Colors.grey),
// //                     backCardBorder: useGlassMorphism
// //                         ? null
// //                         : Border.all(color: Colors.grey),
// //                     showBackView: isCvvFocused,
// //                     obscureCardNumber: true,
// //                     obscureCardCvv: true,
// //                     isHolderNameVisible: true,
// //                     cardBgColor: white,
// //                     backgroundImage:
// //                         useBackgroundImage ? 'images/card_bg.jpg' : null,
// //                     isSwipeGestureEnabled: true,
// //                     onCreditCardWidgetChange:
// //                         (CreditCardBrand creditCardBrand) {},
// //                     customCardTypeIcons: <CustomCardTypeIcon>[
// //                       CustomCardTypeIcon(
// //                         cardType: CardType.mastercard,
// //                         cardImage: Image.asset(
// //                           'images/master_card_logo.png',
// //                           height: 48,
// //                           width: 48,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   Expanded(
// //                     child: SingleChildScrollView(
// //                       child: Column(
// //                         children: <Widget>[
// //                           CreditCardForm(
// //                             formKey: formKey,
// //                             obscureCvv: true,
// //                             obscureNumber: true,
// //                             cardNumber: cardNumber,
// //                             cvvCode: cvvCode,
// //                             isHolderNameVisible: true,
// //                             isCardNumberVisible: true,
// //                             isExpiryDateVisible: true,
// //                             cardHolderName: cardHolderName,
// //                             expiryDate: expiryDate,
// //                             inputConfiguration: const InputConfiguration(
// //                               cardNumberDecoration: InputDecoration(
// //                                 labelText: 'Numero de la carte',
// //                                 hintText: 'XXXX XXXX XXXX XXXX',
// //                               ),
// //                               expiryDateDecoration: InputDecoration(
// //                                 labelText: 'Date d\'Expiration',
// //                                 hintText: 'XX/XX',
// //                               ),
// //                               cvvCodeDecoration: InputDecoration(
// //                                 labelText: 'CVV',
// //                                 hintText: 'XXX',
// //                               ),
// //                               cardHolderDecoration: InputDecoration(
// //                                 labelText: 'Titulaire de la carte',
// //                               ),
// //                             ),
// //                             onCreditCardModelChange: onCreditCardModelChange,
// //                           ),
// //                           const SizedBox(height: 20),
// //                           Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 16),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: <Widget>[
// //                                 const Text('Glassmorphism'),
// //                                 const Spacer(),
// //                                 Switch(
// //                                   value: useGlassMorphism,
// //                                   inactiveTrackColor: Colors.grey,
// //                                   activeColor: Colors.white,
// //                                   activeTrackColor: primary,
// //                                   onChanged: (bool value) => setState(() {
// //                                     useGlassMorphism = value;
// //                                   }),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 16),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: <Widget>[
// //                                 const Text('Image de la carte'),
// //                                 const Spacer(),
// //                                 Switch(
// //                                   value: useBackgroundImage,
// //                                   inactiveTrackColor: Colors.grey,
// //                                   activeColor: Colors.white,
// //                                   activeTrackColor: primary,
// //                                   onChanged: (bool value) => setState(() {
// //                                     useBackgroundImage = value;
// //                                   }),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 16),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: <Widget>[
// //                                 const Text('Carte Flottante'),
// //                                 const Spacer(),
// //                                 Switch(
// //                                   value: useFloatingAnimation,
// //                                   inactiveTrackColor: Colors.grey,
// //                                   activeColor: Colors.white,
// //                                   activeTrackColor: primary,
// //                                   onChanged: (bool value) => setState(() {
// //                                     useFloatingAnimation = value;
// //                                   }),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           const SizedBox(height: 20),
// //                           GestureDetector(
// //                             onTap: _onValidate,
// //                             child: Container(
// //                               margin: const EdgeInsets.symmetric(
// //                                 horizontal: 16,
// //                                 vertical: 8,
// //                               ),
// //                               decoration: const BoxDecoration(
// //                                 gradient: LinearGradient(
// //                                   colors: <Color>[
// //                                     primary,
// //                                     primary,
// //                                     secondary,
// //                                     red,
// //                                     white,
// //                                     green,
// //                                     primary,
// //                                   ],
// //                                   begin: Alignment(-1, -4),
// //                                   end: Alignment(1, 4),
// //                                 ),
// //                                 borderRadius: BorderRadius.all(
// //                                   Radius.circular(8),
// //                                 ),
// //                               ),
// //                               padding: const EdgeInsets.symmetric(vertical: 15),
// //                               alignment: Alignment.center,
// //                               child: const Text(
// //                                 'Valider',
// //                                 style: TextStyle(
// //                                   color: Colors.black,
// //                                   fontFamily: 'halter',
// //                                   fontSize: 14,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   void onValidate() {
// //     if (formKey.currentState?.validate() ?? false) {
// //       // ignore: avoid_print
// //       print('valide!');
// //     } else {
// //       // ignore: avoid_print
// //       print('invalide!');
// //     }
// //   }

// //   Glassmorphism? _getGlassmorphismConfig() {
// //     if (!useGlassMorphism) {
// //       return null;
// //     }

// //     final LinearGradient gradient = LinearGradient(
// //       begin: Alignment.topLeft,
// //       end: Alignment.bottomRight,
// //       colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
// //       stops: const <double>[0.3, 0],
// //     );

// //     return Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient);
// //   }

// //   void onCreditCardModelChange(CreditCardModel creditCardModel) {
// //     setState(() {
// //       cardNumber = creditCardModel.cardNumber;
// //       expiryDate = creditCardModel.expiryDate;
// //       cardHolderName = creditCardModel.cardHolderName;
// //       cvvCode = creditCardModel.cvvCode;
// //       isCvvFocused = creditCardModel.isCvvFocused;
// //     });
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:mobile_transfert_app/theme/color.dart';

// class CardForm extends StatefulWidget {
//   const CardForm({super.key});

//   @override
//   State<CardForm> createState() => _CardFormState();
// }

// class _CardFormState extends State<CardForm> {
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cardHolderNameController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     cardNumberController.dispose();
//     expiryDateController.dispose();
//     cardHolderNameController.dispose();
//     cvvController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context); // Action de retour
//           },
//       ),),
//       resizeToAvoidBottomInset: false,
//       body: Builder(
//         builder: (BuildContext context) {
//           return Container(
//             color: Colors.white,
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   CreditCardWidget(
//                     cardNumber: cardNumberController.text,
//                     expiryDate: expiryDateController.text,
//                     cardHolderName: cardHolderNameController.text,
//                     cvvCode: cvvController.text,
//                     bankName: 'SeedPay',
//                     frontCardBorder: Border.all(color: Colors.grey),
//                     backCardBorder: Border.all(color: Colors.grey),
//                     showBackView: false,
//                     obscureCardNumber: true,
//                     obscureCardCvv: true,
//                     isHolderNameVisible: true,
//                     cardBgColor: primary,
//                     isSwipeGestureEnabled: true,
//                     onCreditCardWidgetChange:
//                         (CreditCardBrand creditCardBrand) {},
//                     customCardTypeIcons: <CustomCardTypeIcon>[
//                       CustomCardTypeIcon(
//                         cardType: CardType.mastercard,
//                         cardImage: Image.asset(
//                           'images/master_card_logo.png',
//                           height: 48,
//                           width: 48,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Form(
//                         key: formKey,
//                         child: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: TextFormField(
//                                 controller: cardNumberController,
//                                 decoration: InputDecoration(
//                                   labelText: 'Numero de la carte',
//                                   hintText: 'XXXX XXXX XXXX XXXX',
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.withOpacity(0.7),
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Veuillez entrer le numéro de votre carte';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: TextFormField(
//                                 controller: expiryDateController,
//                                 decoration: InputDecoration(
//                                   labelText: 'Date d\'Expiration',
//                                   hintText: 'MM/YY',
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.withOpacity(0.7),
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Veuillez entrer la date d\'expiration de votre carte';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: TextFormField(
//                                 controller: cardHolderNameController,
//                                 decoration: InputDecoration(
//                                   labelText: 'Titulaire de la carte',
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.withOpacity(0.7),
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Veuillez entrer le nom du titulaire de la carte';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: TextFormField(
//                                 controller: cvvController,
//                                 decoration: InputDecoration(
//                                   labelText: 'CVV',
//                                   hintText: 'XXX',
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.withOpacity(0.7),
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Veuillez entrer le code CVV de votre carte';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               child: ElevatedButton(
//                                 onPressed: onValidate,
//                                 child: const Text('Valider'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void onValidate() {
//     if (formKey.currentState!.validate()) {
//       // Les données sont valides, vous pouvez les utiliser ici
//       print('Données valides:');
//       print('Numéro de carte: ${cardNumberController.text}');
//       print('Date d\'expiration: ${expiryDateController.text}');
//       print('Titulaire de la carte: ${cardHolderNameController.text}');
//       print('Code CVV: ${cvvController.text}');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobile_transfert_app/theme/color.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvController.dispose();
    super.dispose();
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
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumberController.text,
              expiryDate: expiryDateController.text,
              cardHolderName: cardHolderNameController.text,
              cvvCode: cvvController.text,
              bankName: 'SeedPay',
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: primary,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'images/master_card_logo.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Container(
              height: 10,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, primary],
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: cardNumberController,
                      decoration: InputDecoration(
                        labelText: 'Numero de la carte',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.7),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le numéro de votre carte';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Date d\'Expiration',
                        hintText: 'MM/YY',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.7),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer la date d\'expiration de votre carte';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: cardHolderNameController,
                      decoration: InputDecoration(
                        labelText: 'Titulaire de la carte',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.7),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le nom du titulaire de la carte';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: 'XXX',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.7),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le code CVV de votre carte';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.green,
                              minimumSize: const Size(100, 0),
                        ),
                      onPressed: onValidate,
              child: const Text('Valider',style: TextStyle(color: white),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onValidate() {
    if (formKey.currentState!.validate()) {
      // Les données sont valides, vous pouvez les utiliser ici
      print('Données valides:');
      print('Numéro de carte: ${cardNumberController.text}');
      print('Date d\'expiration: ${expiryDateController.text}');
      print('Titulaire de la carte: ${cardHolderNameController.text}');
      print('Code CVV: ${cvvController.text}');
    }
  }
}
