import 'package:flutter/material.dart';

class PicText extends StatefulWidget {
  final title;
  final text;
  final picLocation;
  final picOnLeft;

  PicText(this.title, this.text, this.picLocation, this.picOnLeft);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<PicText> {
  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
              widget.picOnLeft ? getImage() : getDescription(),
              widget.picOnLeft ? getDescription() : getImage(),
            ],
          );
  }

  Widget getImage() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 10, top: 40),
        child: Image.asset(widget.picLocation)
    );
  }

  Widget getDescription() {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                  widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(widget.text)
            ],
          )
        )
    );
  }
}