import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  final text;
  final showButton;
  final picLocation;

  CustomBanner(this.text, this.showButton, this.picLocation);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<CustomBanner> {
  @override
  build(context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(widget.picLocation),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: new Container(
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.1)
                      ),
                    ))
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  child: bannerText()
                )
            ]
        )
    );
  }

  Widget bannerText() {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SelectableText(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          widget.showButton
              ? Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    learnMoreButton()
                  ]
                )
              : Container()
        ]
    );
  }

  Widget learnMoreButton() {
    return FlatButton(
        padding: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white, width: 2),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/contactUs');
      },
      child: Text(
          "LEARN MORE",
          style: TextStyle(color: Colors.white, fontSize: 15))
    );
  }
}