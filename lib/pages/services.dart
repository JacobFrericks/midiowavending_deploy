import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/footer.dart';
import 'package:midiowavending_flutter/pictext.dart';

import '../appbar.dart';
import '../banner.dart';

class VendingServices extends StatefulWidget {
  VendingServices({Key key}) : super(key: key);

  @override
  _VendingServicesState createState() => _VendingServicesState();
}

class _VendingServicesState extends State<VendingServices> {

  @override
  Widget build(BuildContext context) {
    var title1 = "Your source for superior vending services at your property";
    var body1 = "We will provide you with the best in class vending solution for your employees or visitors. We provide a variety of machines to ensure responsive sales and customer service to ensure that everything is filled and working properly at all times.";
    var pic1 = "assets/side_pic6.jpeg";

    var title2 = "Latest technologies";
    var body2 = "Gone are the days of digging for loose change or waiting for your card to process. With a swipe up on your phone, making everyday payments is simple — for everyone. Faster than inserting coins into a machine. PayRange is the quickest way to pay for the things you do often. Use all major credit and debit cards or add funds via Apple Pay, Android Pay or Masterpass.";
    var pic2 = "assets/payrange.jpg";
    List<Widget> vendingServicesWidgets = <Widget>[
      banner(),
      PicText(title1, body1, pic1, true),
      PicText(title2, body2, pic2, false),
      Footer()
    ];

    return ListView.builder (
      shrinkWrap: true,
      itemCount: vendingServicesWidgets.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return vendingServicesWidgets[index];
      },
    );
  }

  Widget banner() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: new CustomAppBar(new CustomBanner("Vending Services", false, "assets/banner_3.jpeg")),
    );
  }
}