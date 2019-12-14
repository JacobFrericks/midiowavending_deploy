import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  CustomBanner();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<CustomBanner> {
  @override
  build(context) {
    return new Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/banner_1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.black.withOpacity(0.1)
              ),
            ))
    );
  }
}