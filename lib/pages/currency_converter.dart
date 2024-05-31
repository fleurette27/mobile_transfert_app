
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:mobile_transfert_app/theme/color.dart';
import 'package:mobile_transfert_app/services/currency_service.dart';
import 'package:get/get.dart';

class CurrencyDevise extends StatefulWidget {
  const CurrencyDevise({super.key});

  @override
  CurrencyDeviseState createState() => CurrencyDeviseState();

  static toDouble(String json) {}
}

class CurrencyDeviseState extends State<CurrencyDevise> {

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  API api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Conversion",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownMenu(
                      enableFilter: false,
                      enableSearch: false,
                      controller: _fromController,
                      initialSelection: "USD",
                      menuHeight: 360,
                      label: const Text("De"),
                      menuStyle: MenuStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Theme.of(context).canvasColor),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 10.0),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "USD", label: "USD"),
                        DropdownMenuEntry(value: "EUR", label: "EUR"),
                        DropdownMenuEntry(value: "XOF", label: "XOF"),
                        DropdownMenuEntry(value: "GBP", label: "GBP"),
                        DropdownMenuEntry(value: "JPY", label: "JPY"),
                        DropdownMenuEntry(value: "AUD", label: "AUD"),
                        DropdownMenuEntry(value: "CAD", label: "CAD"),
                        DropdownMenuEntry(value: "CHF", label: "CHF"),
                        DropdownMenuEntry(value: "EGP", label: "EGP"),
                        DropdownMenuEntry(value: "CNY", label: "CNY"),
                        DropdownMenuEntry(value: "HKD", label: "HKD"),
                        DropdownMenuEntry(value: "NZD", label: "NZD"),
                        DropdownMenuEntry(value: "SEK", label: "SEK"),
                        DropdownMenuEntry(value: "SGD", label: "SGD"),
                        DropdownMenuEntry(value: "KRW", label: "KRW"),
                        DropdownMenuEntry(value: "MXN", label: "MXN"),
                        DropdownMenuEntry(value: "INR", label: "INR"),
                        DropdownMenuEntry(value: "RUB", label: "RUB"),
                        DropdownMenuEntry(value: "ZAR", label: "ZAR"),
                        DropdownMenuEntry(value: "TRY", label: "TRY"),
                        DropdownMenuEntry(value: "BRL", label: "BRL"),
                        DropdownMenuEntry(value: "TWD", label: "TWD"),
                        DropdownMenuEntry(value: "THB", label: "THB"),
                        DropdownMenuEntry(value: "MYR", label: "MYR"),
                        DropdownMenuEntry(value: "PHP", label: "PHP"),
                        DropdownMenuEntry(value: "IDR", label: "IDR"),
                      ]),
                  DropdownMenu(
                      enableFilter: false,
                      enableSearch: false,
                      controller: _toController,
                      initialSelection: "USD",
                      menuHeight: 360,
                      label: const Text("A"),
                      menuStyle: MenuStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Theme.of(context).canvasColor),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 10.0),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "USD", label: "USD"),
                        DropdownMenuEntry(value: "EUR", label: "EUR"),
                        DropdownMenuEntry(value: "XOF", label: "XOF"),
                        DropdownMenuEntry(value: "GBP", label: "GBP"),
                        DropdownMenuEntry(value: "JPY", label: "JPY"),
                        DropdownMenuEntry(value: "AUD", label: "AUD"),
                        DropdownMenuEntry(value: "CAD", label: "CAD"),
                        DropdownMenuEntry(value: "CHF", label: "CHF"),
                        DropdownMenuEntry(value: "EGP", label: "EGP"),
                        DropdownMenuEntry(value: "CNY", label: "CNY"),
                        DropdownMenuEntry(value: "HKD", label: "HKD"),
                        DropdownMenuEntry(value: "NZD", label: "NZD"),
                        DropdownMenuEntry(value: "SEK", label: "SEK"),
                        DropdownMenuEntry(value: "SGD", label: "SGD"),
                        DropdownMenuEntry(value: "KRW", label: "KRW"),
                        DropdownMenuEntry(value: "MXN", label: "MXN"),
                        DropdownMenuEntry(value: "INR", label: "INR"),
                        DropdownMenuEntry(value: "RUB", label: "RUB"),
                        DropdownMenuEntry(value: "ZAR", label: "ZAR"),
                        DropdownMenuEntry(value: "TRY", label: "TRY"),
                        DropdownMenuEntry(value: "BRL", label: "BRL"),
                        DropdownMenuEntry(value: "TWD", label: "TWD"),
                        DropdownMenuEntry(value: "THB", label: "THB"),
                        DropdownMenuEntry(value: "MYR", label: "MYR"),
                        DropdownMenuEntry(value: "PHP", label: "PHP"),
                        DropdownMenuEntry(value: "IDR", label: "IDR"),
                      ]),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'Montant',
                  ),
                  style: const TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Svp rentrez une valeur';
                    } else if (double.parse(value) <= 0) {
                      return 'Svp rentrez un montant valide';
                    } else if (!value.isNumericOnly) {
                      return 'Svp rentrez un montant valide';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                enabled: false,
                style: const TextStyle(fontSize: 22),
                controller: _resultController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  disabledBorder: InputBorder.none,
                  labelText: 'Resultat',
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 50),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var rate = await api.getRate(
                        _fromController.text,
                        _toController.text,
                      );
                      var result = rate * double.parse(_amountController.text);
                      setState(() {
                        _resultController.text = result.toStringAsFixed(2);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    "Convertir",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   String? selectedFromCurrency;
//   String? selectedToCurrency;
//   double amount = 1.0;
//   String? result;

//   // void initState() {
//   //   super.initState();
//   //   convert();
//   // }

//   void convert() async {
//     if (selectedFromCurrency != null && selectedToCurrency != null) {
//       Currency fromCurrency = Currency.values
//           .firstWhere((element) => element.name == selectedFromCurrency);
//       Currency toCurrency = Currency.values
//           .firstWhere((element) => element.name == selectedToCurrency);

//       double? convertedAmount = await CurrencyConverter.convert(
//         from: fromCurrency,
//         to: toCurrency,
//         amount: amount,
//         withoutRounding: true,
//       );
//       setState(() {
//         result = convertedAmount.toString();
//       });
//     }
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
//           "Conversion de devise",
//           style: TextStyle(color: white, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: primary,
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Row(children: [
//                 const Text(
//                   'De : ',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 DropdownButton<String>(
//                   value: selectedFromCurrency,
//                   items: Currency.values
//                       .map((currency) => DropdownMenuItem<String>(
//                             value: currency.name.toUpperCase(),
//                             child: Text(currency.name.toUpperCase()),
//                           ))
//                       .toList(),
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedFromCurrency = value;
//                     });
//                   },
//                 ),
//                 const SizedBox(width: 15),
//                 const Text(
//                   'A : ',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 DropdownButton<String>(
//                   value: selectedToCurrency,
//                   items: Currency.values
//                       .map((currency) => DropdownMenuItem<String>(
//                             value: currency.name.toUpperCase(),
//                             child: Text(currency.name.toUpperCase()),
//                           ))
//                       .toList(),
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedToCurrency = value;
//                     });
//                   },
//                 ),
//               ]),
//               const SizedBox(height: 10),
//               TextField(
//                 decoration: const InputDecoration(labelText: 'Montant'),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     amount = double.tryParse(value) ?? 1.0;
//                   });
//                 },
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   convert();
//                 },
//                 child: const Text('Convertir'),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Resultat de la conversion: $result',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
