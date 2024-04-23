import 'package:flutter/material.dart';
import 'package:mobile_transfert_app/pages/function.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () async {
                await disconnect();
              },
              icon: const Icon(Icons.power))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Phone number: ${user?.phoneNumber ?? ""}"),
            // Text("Uid: ${user?.uid ?? ""}")
          ],
        ),
      ),
    );
  }
}
