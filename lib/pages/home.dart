import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mobile_transfert_app/pages/account_page.dart';
import 'package:mobile_transfert_app/pages/card_page.dart';
import 'package:mobile_transfert_app/pages/dashboard_page.dart';
import 'package:mobile_transfert_app/theme/color.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white, 
        bottomNavigationBar: getFooter(),
        body: getBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            backgroundColor: primary,
            child: const Icon(
              Icons.credit_card,
              size: 25,
            )
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DashbaordPage(),
        Center(
          child: Text("Page de trans",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Page de Notification",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        //page du compte
        UserAccount(),
        // Center(
        //   child: Text("Page du compte",style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold
        //   ),),
        // ),
        //page des cartes
        CardPage(),
        // Center(
        //   child: Text("Page des cartes",style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold
        //   ),),
        // ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home,
      Icons.comment,
      Icons.notifications,
      Icons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 await disconnect();
//               },
//               icon: const Icon(Icons.power))
//         ],
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Text("Phone number: ${user?.phoneNumber ?? ""}"),
//             // Text("Uid: ${user?.uid ?? ""}")
//           ],
//         ),
//       ),
//     );
//   }
// }



