import 'package:flutter/material.dart';
import 'Cart/cart_products.dart';
import 'Pages/Login_page.dart';
import 'Pages/products_page.dart';
import 'Pages/search_page.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  final screens = [
    ProductsPage(),
    MyWidget(),
    CartProducts(),
    const LoginPage(),
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar().screens.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black12,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
