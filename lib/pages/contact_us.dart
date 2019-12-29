import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  @override
  Widget build(BuildContext context) {

    return Text("ContactUs");
  }
}