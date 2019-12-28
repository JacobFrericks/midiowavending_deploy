import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  final title;

  CustomAppBar(this.title);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<CustomAppBar> {

  @override
  build(context) {
    var showLongAppBar = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: getAppBar(showLongAppBar),
      endDrawer: showLongAppBar ? Container() :
      Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: getAppBarActions(true)
            ),
            elevation: 0,
          )
      ),
      body: new Container(
        color: Colors.transparent,
      ),
    );
  }

  AppBar getAppBar(bool showLongAppBar) {
    if (showLongAppBar) {
      return new AppBar(
        title: new SelectableText(widget.title, style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: getAppBarActions(false),
      );
    }
    return new AppBar(
      title: new SelectableText(widget.title, style: TextStyle(fontSize: 25)),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  List<Widget> getAppBarActions(bool fromHamburgerMenu) {
    return <Widget>[
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Home was tapped!"); },
        child: Center(child: SelectableText("Home", style: TextStyle(fontSize: 20, color: Colors.white))),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Vending Products was tapped!"); },
        child: Center(child:
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: SelectableText("Vending Products", style: TextStyle(fontSize: 20, color: Colors.white))
        )
        ),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Vending Services was tapped!"); },
        child: Center(child:
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: SelectableText("Vending Services", style: TextStyle(fontSize: 20, color: Colors.white))
        )
        ),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Contact Us was tapped!"); },
        child: Center(child:
        Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: SelectableText("Contact Us", style: TextStyle(fontSize: 20, color: Colors.white))
        )
        ),
      ),
    ];
  }
}
