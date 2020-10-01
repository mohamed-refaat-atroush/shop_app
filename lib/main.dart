import 'package:flutter/material.dart';
import 'package:shop_app/providers/carts.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'providers/products.dart';
import 'screens/edit_product_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Carts()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'shop app',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Color(0xffFF5722),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ProductScreen.routeName,
        routes: {
          CartScreen.routeName: (context) => CartScreen(),
          ProductScreen.routeName: (context) => ProductScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          EditProductScreen.routeName:(context)=>EditProductScreen()
        },
      ),
    );
  }
}
