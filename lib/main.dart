import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nile_shipping/Cart/cart_products.dart';
import 'package:nile_shipping/Services/analytics_service.dart';
import 'package:nile_shipping/nav_bar.dart';
import 'package:nile_shipping/pages/Login_page.dart';
import 'package:nile_shipping/pages/new_product_screen.dart';
import 'package:nile_shipping/pages/products_page.dart';
import 'package:nile_shipping/pages/search_page.dart';
import 'package:nile_shipping/Search/search_bar.dart';
import 'package:nile_shipping/themes/input_text_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Nile Shipping';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: _title,
        theme: ThemeData(
          inputDecorationTheme: MyInputTheme().theme(),
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
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
        navigatorObservers: [AnalyticsService().getAnalyticsObserver()],
      );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(),
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
      body: NavBar(),
    );
  }
}
