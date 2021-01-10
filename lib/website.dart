import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/pages/under_construction.dart';
import 'pages/contact_us.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'pages/services.dart';

class Website extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool underConstruction = true;

    if (underConstruction) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Scaffold(body: UnderConstruction()),
            '/products': (context) => Scaffold(body: UnderConstruction()),
            '/services': (context) => Scaffold(body: UnderConstruction()),
            '/contactUs': (context) => Scaffold(body: UnderConstruction()),
          }
      );
    }

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
