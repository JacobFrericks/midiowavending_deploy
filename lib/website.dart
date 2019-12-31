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
        '/': (context) => Scaffold(body: HomePage()),
        '/products': (context) => Scaffold(body: VendingProducts()),
        '/services': (context) => Scaffold(body: VendingServices()),
        '/contactUs': (context) => Scaffold(body: ContactUs()),
      }
    );
  }
}
