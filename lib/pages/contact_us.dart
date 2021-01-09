import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../appbar.dart';
import '../banner.dart';


class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _message;
  final TextEditingController _nameTextController = new TextEditingController();
  final TextEditingController _emailTextController = new TextEditingController();
  final TextEditingController _messageTextController = new TextEditingController();
  bool _isSubmitButtonDisabled;

  @override
  void initState() {
    _isSubmitButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> contactUsWidgets = <Widget>[
      banner(),
      new Container(
        margin: new EdgeInsets.all(15.0),
        child: new Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: FormUI(),
        ),
      ),
    ];

    return ListView.builder (
        shrinkWrap: true,
        itemCount: contactUsWidgets.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return contactUsWidgets[index];
        },
    );
  }

  Widget banner() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: new CustomAppBar( new CustomBanner("Contact Us", false, "assets/banner_4.jpeg"))
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          controller: _nameTextController,
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onChanged: (text) {
            _name = text;
          },
        ),
        new TextFormField(
          controller: _emailTextController,
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onChanged: (text) {
            _email = text;
          },
        ),
        new TextFormField(
          controller: _messageTextController,
          decoration: const InputDecoration(labelText: 'Message'),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (text) {
            _message = text;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: _isSubmitButtonDisabled
                ? new Text('Loading...', style: TextStyle(color: Colors.white))
                : new Text('Submit'),
          color: _isSubmitButtonDisabled
            ? Color(0xFFeeeeee)
            : Color(0xFFD3D3D3)
        )
      ],
    );
  }

  _showSnackBar() {
    var successMessage = "Thank you! We will respond to your message soon!";
    final snackbar = SnackBar(
        content: new Text(successMessage, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        backgroundColor: Colors.green
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  _showErrorSnackBar() {
    var errorMessage = "Oops! Something happened! Try again later.";
    final snackbar = SnackBar(
        content: new Text(errorMessage, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        backgroundColor: Colors.red
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 characters';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void _validateInputs() {
    if (_isSubmitButtonDisabled) {
      return null;
    } else {
      setState(() =>  _isSubmitButtonDisabled = true);
    }

    _sendEmail();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _clearTextFields() {
    _nameTextController.clear();
    _emailTextController.clear();
    _messageTextController.clear();
  }

  void _sendEmail() async {
    final http.Response response = await http.post(
       'https://bejomkze58.execute-api.us-east-1.amazonaws.com/default/email-bobs-vending',
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>{
         "message": "$_message",
         "name": "$_name",
         "email": "$_email"
       })
    );

    if(response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      _showSnackBar();
      _clearTextFields();
    } else {
      _showErrorSnackBar();
    }

    setState(() =>  _isSubmitButtonDisabled = false );
  }
}