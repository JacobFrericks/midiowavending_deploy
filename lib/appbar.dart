import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  Widget background;
  String selected;
  CustomAppBar(this.background, this.selected);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<CustomAppBar> {

  @override
  build(context) {
    var showLongAppBar = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: getAppBar(showLongAppBar, widget.selected),
      endDrawer: getEndDrawer(showLongAppBar),
      body: widget.background,
      extendBodyBehindAppBar: true
    );
  }

  Widget getEndDrawer(bool showLongAppBar) {
    return showLongAppBar
        ? Container()
        : Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: getAppBarActions(true, "")
              ),
              elevation: 0,
            )
        );
  }

  AppBar getAppBar(bool showLongAppBar, String selected) {
    if (showLongAppBar) {
      return new AppBar(
        title: new SelectableText("Mid Iowa Vending", style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: getAppBarActions(false, selected)
      );
    }
    return new AppBar(
      title: new SelectableText("Mid Iowa Vending", style: TextStyle(fontSize: 25)),
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

  List<Widget> getAppBarActions(bool fromHamburgerMenu, String selected) {
    return <Widget>[
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: getActionChild("Home", selected)
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/products'),
        child: getActionChild("Products", selected)
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/services'),
        child: getActionChild("Services", selected)
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/contactUs'),
        child: getActionChild("Contact", selected)
      ),
      Padding(padding: EdgeInsets.only(right: 8))
    ];
  }

  getActionChild(String text, String selected) {

    Color color = selected == text
        ? Color(0xFF000000).withOpacity(.3)
        : Color(0xFF000000).withOpacity(0);

    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: DecoratedBox(
        decoration: new BoxDecoration(color: color),
        child: Center(child:
          Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white))
          )
        ),
      )
    );
  }
}
