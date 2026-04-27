import 'package:flutter/material.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/profile/presentation/screens/profile_screen.dart';
import '../../../cart/presentation/screens/shopping_cart_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ShoppingCartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFBF9F8),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        selectedItemColor: Color(0xff061F3D),
        unselectedItemColor: Color(0xffA8A29E),

        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),

        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: "SHOP"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "SAVED",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: "MY CART",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "PROFILE",
          ),
        ],
      ),
    );
  }
}
