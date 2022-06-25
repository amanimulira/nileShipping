import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nile_shipping/cart_products.dart';
import 'package:nile_shipping/pages/new_product_screen.dart';
import 'package:nile_shipping/pages/products_page.dart';
import 'package:nile_shipping/pages/search_page.dart';
import 'package:nile_shipping/search_bar.dart';

import 'dot_slider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: _title,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: const TextStyle(),
            bodyText2: const TextStyle(),
          ).apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(0, 248, 84, 84),
              secondary: Color.fromARGB(0, 0, 0, 0)),
        ),
        routes: {
          '/products': (context) => ProductsPage(),
          '/products/new_product_screen': (context) => NewProductScreen(),
        },
        home: const MyStatefulWidget(),
      );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final screens = [
    ProductsPage(),
    MyWidget(),
    CartProducts(),
    PrefetchImageDemo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(149, 22, 156, 116),
                  Color.fromARGB(150, 58, 210, 164)
                ]),
          ),
        ),
      ),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
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
