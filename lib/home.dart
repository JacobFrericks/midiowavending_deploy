import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/pictext.dart';

import 'appbar.dart';
import 'banner.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var title1 = "Experience the highest quality in vending management service";
    var body1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet bibendum enim facilisis gravida neque convallis a. Ac felis donec et odio pellentesque diam volutpat commodo sed. Felis bibendum ut tristique et. Volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in.";
    var pic1 = "assets/preview1.jpg";
    return Scaffold(
        body: Column(
          children: <Widget>[
            banner(),
            PicText(title1, body1, pic1, true)
          ]
        )
    );
  }

  Widget banner() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            new CustomBanner("Quality Vending", true),
            new CustomAppBar(widget.title),
          ],
      )
    );
  }
}