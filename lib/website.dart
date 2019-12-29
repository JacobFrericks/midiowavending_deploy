import 'package:flutter/material.dart';
import 'pages/contact_us.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'pages/services.dart';

class Website extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mid Iowa Vending',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/products': (context) => VendingProducts(),
        '/services': (context) => VendingServices(),
        '/contactUs': (context) => ContactUs(),
      }
    );
  }
}
