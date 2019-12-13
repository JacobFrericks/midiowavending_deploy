import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mid Iowa Vending',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Mid Iowa Vending'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    bool showLongAppBar = false;
    return Stack(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/banner_1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromRGBO(60, 60, 60, 0.19),
        ),
        Scaffold(
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
        ),
      ],
    );
  }

  AppBar getAppBar(bool showLongAppBar) {
    if (showLongAppBar) {
      return new AppBar(
        title: new Text(widget.title, style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: getAppBarActions(false),
      );
    }
    return new AppBar(
      title: new Text(widget.title, style: TextStyle(fontSize: 25)),
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
        child: Center(child: Text("Home", style: TextStyle(fontSize: 20))),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Vending Products was tapped!"); },
        child: Center(child:
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text("Vending Products", style: TextStyle(fontSize: 20))
          )
        ),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Vending Services was tapped!"); },
        child: Center(child:
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text("Vending Services", style: TextStyle(fontSize: 20))
          )
        ),
      ),
      fromHamburgerMenu ? Padding(padding: EdgeInsets.only(top: 5)) : Container(),
      GestureDetector(
        onTap: () { print("Contact Us was tapped!"); },
        child: Center(child:
          Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text("Contact Us", style: TextStyle(fontSize: 20))
          )
        ),
      ),
    ];
  }
}
