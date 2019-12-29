import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/footer.dart';
import 'package:midiowavending_flutter/pictext.dart';

import '../appbar.dart';
import '../banner.dart';

class VendingProducts extends StatefulWidget {
  VendingProducts({Key key}) : super(key: key);

  @override
  _VendingProductsState createState() => _VendingProductsState();
}

class _VendingProductsState extends State<VendingProducts> {

  @override
  Widget build(BuildContext context) {
    var title1 = "Experience the highest quality in vending management service";
    var body1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet bibendum enim facilisis gravida neque convallis a. Ac felis donec et odio pellentesque diam volutpat commodo sed. Felis bibendum ut tristique et. Volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in.";
    var pic1 = "assets/preview3.jpg";

    var title2 = "Experience the highest quality in vending management service";
    var body2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet bibendum enim facilisis gravida neque convallis a. Ac felis donec et odio pellentesque diam volutpat commodo sed. Felis bibendum ut tristique et. Volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in.";
    var pic2 = "assets/preview4.jpg";
    List<Widget> VendingProductsWidgets = <Widget>[
      banner(),
      PicText(title1, body1, pic1, true),
      PicText(title2, body2, pic2, false),
      new Footer()
    ];

    return Scaffold(
        body: ListView.builder (
          shrinkWrap: true,
          itemCount: VendingProductsWidgets.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return VendingProductsWidgets[index];
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
            new CustomBanner("Quality Vending", true, "assets/banner_1.jpeg"),
            new CustomAppBar(),
          ],
        )
    );
  }
}