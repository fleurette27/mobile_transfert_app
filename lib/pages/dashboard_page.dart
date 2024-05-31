// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mobile_transfert_app/model/api_response.dart';
// import 'package:mobile_transfert_app/data_json/balance_json.dart';
import 'package:mobile_transfert_app/pages/account_page.dart';
import 'package:mobile_transfert_app/pages/card_form.dart';
import 'package:mobile_transfert_app/pages/card_page.dart';
import 'package:mobile_transfert_app/pages/currency_converter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_transfert_app/pages/webview_feda.dart';
import 'package:mobile_transfert_app/services/feda_service.dart';
import 'package:mobile_transfert_app/theme/color.dart';
import '../model/transaction.dart';

class DashbaordPage extends StatefulWidget {
  const DashbaordPage({super.key});

  @override
  State<DashbaordPage> createState() => _DashbaordPageState();
}

class _DashbaordPageState extends State<DashbaordPage> {
  //action sur transferer
   String url = '';

  void fedaTransaction() async {
    try{
   final Map<String, dynamic> transactionInfo = await createTransaction();
              setState(() {
                url = transactionInfo['url'];
              });

      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) => WebviewFeda(
                  url: url,
                )),
      );
    } catch(e)

    {
           print('Erreur lors de la création de la transaction : $e');

    }
  }

  int pageIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: primary,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
      drawer: getDrawer(),
      body: getBody(),
    );
  }

  Widget getDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen[900],
            ),
            child: const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Username'),
              subtitle: Text('Numero de compte'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              color: primary,
            ),
            title: const Text('Compte'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserAccount()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.swap_horiz,
              color: primary,
            ),
            title: const Text('Conversion de devise'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CurrencyDevise()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: [
              Image.asset("images/carrousel1.jpg", fit: BoxFit.cover),
              Image.asset("images/carrousel2.jpg", fit: BoxFit.cover),
              Image.asset("images/carrousel3.jpg", fit: BoxFit.cover),
            ],
            carouselController: _controller,
            options: CarouselOptions(
              height: size.height * 0.25,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0;
                i < 3;
                i++) // Remplacez 3 par le nombre d'images que vous avez
              GestureDetector(
                onTap: () => _controller.animateToPage(i),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == i ? 0.9 : 0.4),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(
                      "Recharger",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    fedaTransaction();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(
                      "Transférer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: getAccountSection(),
            ),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 40, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transactions récentes",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: transactions.map((transaction) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          transaction.icon,
                          color: primary,
                        ),
                        title: Text(transaction.title),
                        subtitle: Text(transaction.subtitle),
                      ),
                      const Divider(
                        thickness: 0.2,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cartes",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 90,
                height: 22,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CardForm()),
                    );
                  },
                  child: const Text(
                    "Ajouter une carte",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CardPage()),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.credit_card,
                                  color: primary,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "EUR *2330",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        const Text(
                          "8 199.24 EUR",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
