import 'package:flutter/material.dart';
import 'package:fabric_shop/module/order.dart';
import 'package:fabric_shop/module/product.dart';
import 'package:fabric_shop/screens/products_overview_screen.dart';
import 'package:fabric_shop/screens/view_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:fabric_shop/module/cart.dart';
import 'package:fabric_shop/screens/cart_screen.dart';
import 'package:fabric_shop/screens/orders_screen.dart';
import 'package:fabric_shop/screens/your_products_screen.dart';

void main() => runApp(
  
  MyApp(),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
         ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fabric',
        theme: ThemeData(
          primaryColor: Color(0xff05386B),
          accentColor: Color(0xff8EE4AF),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: { 
          ViewProduct.routeName: (ctx) => ViewProduct(),
          CartScreen.routeName : (ctx) => CartScreen(),
          OrdersScreen.routeName : (ctx) => OrdersScreen(),
          ProductsOverviewScreen.routeName : (ctx) => ProductsOverviewScreen(),
          YourProductsScreen.routeName : (ctx) => YourProductsScreen(),
        },
      ),
    );
  }
}