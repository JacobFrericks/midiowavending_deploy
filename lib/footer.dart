import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  Footer();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return contactUsButton();
  }

  Widget contactUsButton() {
    return  OutlineButton(
      onPressed: (){
        print("YAY!");
      },
      child: Text("CONTACT US", style: TextStyle(color: Colors.white, fontSize: 15)),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(300)),
      borderSide: BorderSide(color: Colors.white, width: 3),
      highlightColor: Colors.red,
    );
  }
}