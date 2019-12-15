import 'package:flutter/material.dart';
import 'home.dart';

class Website extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mid Iowa Vending',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Mid Iowa Vending'),
    );
  }
}
