import 'package:e_commerce/Utils/global_variable.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagelist[index],
      bottomNavigationBar: bottomnav(),
    );
  }





  Padding bottomnav() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w200),
          selectedItemColor: Colors.red.shade400,
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          elevation: 1,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/shop.png',
                height: 24,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/search.png',
                  height: 24,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/shopping-cart.png',
                  height: 24,
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/user.png',
                  height: 24,
                ),
                label: 'User')
          ],
        ),
      ),
    );
  }
}
