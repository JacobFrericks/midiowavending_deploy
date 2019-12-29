import 'package:flutter/material.dart';

class VendingServices extends StatefulWidget {
  VendingServices({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VendingServicesState createState() => _VendingServicesState();
}

class _VendingServicesState extends State<VendingServices> {

  @override
  Widget build(BuildContext context) {

    return Text("VendingServices");
  }
}