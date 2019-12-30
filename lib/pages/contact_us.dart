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
  String _body;

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

    return Scaffold(
        body: ListView.builder (
          shrinkWrap: true,
          itemCount: contactUsWidgets.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return contactUsWidgets[index];
          },
        )
    );
  }

  Widget banner() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            new CustomBanner("Contact Us", false, "assets/banner_4.jpeg"),
            new CustomAppBar(),
          ],
        )
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Body'),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onSaved: (String val) {
            _body = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Submit'),
        )
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
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
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _sendEmail();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _sendEmail() async {
    String postBody = '{"message": "$_body", "name": "$_name", "email": "$_email"}';
    var response = await http.post(
        'https://bejomkze58.execute-api.us-east-1.amazonaws.com/default/email-bobs-vending',
        body: postBody
    );
    print(response.statusCode);
    print(response.body);
//    if(response.statusCode > 200 && response.statusCode < 300) {
//      Scaffold
//          .of(context)
//          .showSnackBar(SnackBar(content: Text('Processing Data')));
//    }
  }
}