import 'package:flutter/material.dart';
import 'package:midiowavending_flutter/footer.dart';
import 'package:midiowavending_flutter/pictext.dart';

import '../appbar.dart';
import '../banner.dart';

class UnderConstruction extends StatefulWidget {
  UnderConstruction({Key key}) : super(key: key);

  @override
  _UnderConstructionState createState() => _UnderConstructionState();
}

class _UnderConstructionState extends State<UnderConstruction> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.asset("under_construction.jpg"),
        ),
      ],
    );
  }
}