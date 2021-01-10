import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/footer.dart';
import 'package:midiowavending_flutter/pictext.dart';

import '../appbar.dart';
import '../banner.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var title1 = "Experience the highest quality in vending management service";
    var body1 = "We have real people providing real service. You can benefit from our comprehensive, in-depth vending knowledge and service. We will establish and maintain highly satisfied customers and employees.";
    var pic1 = "assets/side_pic1.jpeg";

    var title2 = "Your complete satisfaction is important to us";
    var body2 = "We continually strive for excellence, and we create mutually beneficial relationships with our customers. To that end, we offer a 100% satisfaction guarantee. We know you'll love our products, but even if you don't please contact us and we will make sure you are satisfied!";
    var pic2 = "assets/side_pic2.jpeg";
    List<Widget> homepageWidgets = <Widget>[
      banner(),
      PicText(title1, body1, pic1, true),
      PicText(title2, body2, pic2, false),
      new Footer()
    ];

    return ListView.builder (
      shrinkWrap: true,
      itemCount: homepageWidgets.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return homepageWidgets[index];
      },
    );
  }

  Widget banner() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: new CustomAppBar(new CustomBanner("Quality Vending", true, "assets/banner_1.jpeg"), "Home"),
    );
  }
}