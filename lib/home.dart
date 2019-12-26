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

    var title2 = "Experience the highest quality in vending management service";
    var body2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet bibendum enim facilisis gravida neque convallis a. Ac felis donec et odio pellentesque diam volutpat commodo sed. Felis bibendum ut tristique et. Volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in.";
    var pic2 = "assets/preview2.jpg";
    return Scaffold(
        body: ListView.builder (
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext ctxt, int index) {
              if (index == 0) {
                return banner();
              } else if(index == 1) {
                return PicText(title1, body1, pic1, true);
              } else {
                return PicText(title2, body2, pic2, false);
              }
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
            new CustomBanner("Quality Vending", true),
            new CustomAppBar(widget.title),
          ],
      )
    );
  }
}