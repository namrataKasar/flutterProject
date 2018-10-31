import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter DemoEmergency Contacts',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new MyHomePage(title: 'Emergency Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void onPressed() {
    print('Button pressed');
  }
  void onChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),

                  hintText: 'Search Here'
              ),
              onChanged: (String value){onChanged(value);},
            ),

            new RaisedButton(
                child: new Text('Search'),
                onPressed: () {
                  onPressed();
                }
            ),
            new RaisedButton(
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliceScreen()),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text("Police"),

            ),
            new RaisedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FireScreen()),
                );
            },
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text("Fire"),
            ),
          ],
        ),
      ),

    );
  }
}

class PoliceScreen extends StatefulWidget {
  @override
  _PoliceScreenState createState() => _PoliceScreenState();
}

class _PoliceScreenState extends State<PoliceScreen> {

  static const IconData add_call = IconData(0xe0e8, fontFamily: 'MaterialIcons');



  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Information about SJPD"),
      ),
      body: ListView(
        children: [
          Image.asset(
            'sjpd.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignm ent.spaceEvenly,
          children: [
            buildButtonColumn(Icons.call, 'CALL'),
            buildButtonColumn(Icons.near_me, 'ROUTE'),
            buildButtonColumn(Icons.share, 'SHARE'),
          ],
        ),
      ),
        ],
      ),

    );

  }
}

class FireScreen extends StatefulWidget {
  @override
  _FireScreenState createState() => _FireScreenState();
}

class _FireScreenState extends State<FireScreen> {

  static const IconData add_call = IconData(0xe0e8, fontFamily: 'MaterialIcons');



  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Information about SJPD"),
      ),
      body: ListView(
        children: [
          Image.asset(
            'sjpd.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonColumn(Icons.call, 'CALL'),
                buildButtonColumn(Icons.near_me, 'ROUTE'),
                buildButtonColumn(Icons.share, 'SHARE'),
              ],
            ),
          ),
        ],
      ),

    );

  }
}

Column buildButtonColumn(IconData icon, String label) {
  Color color = Colors.blue;

  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}