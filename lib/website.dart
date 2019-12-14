import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midiowavending_flutter/appbar.dart';

import 'banner.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new CustomBanner(),
        new CustomAppBar(widget.title),
      ],
    );
  }


}
