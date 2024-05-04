
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:mobile_transfert_app/theme/color.dart';

class CurrencyDevise extends StatefulWidget {
  const CurrencyDevise({super.key});

  @override
  CurrencyDeviseState createState() => CurrencyDeviseState();
}

class CurrencyDeviseState extends State<CurrencyDevise> {
  String? selectedFromCurrency;
  String? selectedToCurrency;
  double amount = 1.0;
  String? result;

  // void initState() {
  //   super.initState();
  //   convert();
  // }

  void convert() async {
    if (selectedFromCurrency != null && selectedToCurrency != null) {
      Currency fromCurrency = Currency.values
          .firstWhere((element) => element.name == selectedFromCurrency);
      Currency toCurrency = Currency.values
          .firstWhere((element) => element.name == selectedToCurrency);

      double? convertedAmount = await CurrencyConverter.convert(
        from: fromCurrency,
        to: toCurrency,
        amount: amount,
        withoutRounding: true,
      );
      setState(() {
        result = convertedAmount.toString();
      });
    }
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
          "Conversion de devise",
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: primary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(children: [
                const Text(
                  'De : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedFromCurrency,
                  items: Currency.values
                      .map((currency) => DropdownMenuItem<String>(
                            value: currency.name.toUpperCase(),
                            child: Text(currency.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedFromCurrency = value;
                    });
                  },
                ),
                const SizedBox(width: 15),
                const Text(
                  'A : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedToCurrency,
                  items: Currency.values
                      .map((currency) => DropdownMenuItem<String>(
                            value: currency.name.toUpperCase(),
                            child: Text(currency.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedToCurrency = value;
                    });
                  },
                ),
              ]),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: 'Montant'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 1.0;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  convert();
                },
                child: const Text('Convertir'),
              ),
              const SizedBox(height: 10),
              Text(
                'Resultat de la conversion: $result',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
