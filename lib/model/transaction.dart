
import 'package:flutter/material.dart';

class Transaction {
  final IconData icon;
  final String title;
  final String subtitle;

  Transaction(
      {required this.icon, required this.title, required this.subtitle});
}

final List<Transaction> transactions = [
  Transaction(
    icon: Icons.attach_money,
    title: "Paiement de 100 EUR à John Doe",
    subtitle: "Date: 30 Avril 2024",
  ),
  Transaction(
    icon: Icons.monetization_on,
    title: "Recharge de 50 000 FCFA",
    subtitle: "Date: 29 Avril 2024",
  ),
  Transaction(
    icon: Icons.money_off,
    title: "Retrait de 200 EUR",
    subtitle: "Date: 28 Avril 2024",
  ),
  // Ajoutez d'autres transactions ici
];

class FedaTransaction {
  String token;
  String url;

  FedaTransaction({required this.token, required this.url});

  factory FedaTransaction.fromJson(Map<String, dynamic> json) {
    return FedaTransaction(
      token: json['token']['token'],
      url: json['token']['url'],
    );
  }
}
