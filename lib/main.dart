import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'listview.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  // runApp(MyApp());
  runApp(MaterialApp(
    title: 'Shopping App',
    home: Scaffold(
      appBar: AppBar(
        title: new Text('Flutter test application'),
      ),
      body: ShoppingListWidget(),
      floatingActionButton: FloatingActionButton(
    child: Icon(Icons.sentiment_very_satisfied,),
    onPressed: () =>
        Fluttertoast.showToast(msg: 'clicked!!',
            backgroundColor: Colors.black54,
            toastLength: Toast.LENGTH_SHORT),
  ),
  )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PositionedTiles()
      // home: MyHomePage(title: 'Formicae\'s project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTileState();
}

class PositionedTileState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(color: Colors.red),
    StatelessColorfulTile(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children:
          [Row(children: tiles,
              mainAxisAlignment: MainAxisAlignment.center),
            Text('hello'),
            Text('asdfadfadfadsfadfa')],
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied,),
        onPressed: swapTiles,
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}


class StatelessColorfulTile extends StatelessWidget {
  final Color color;

  StatelessColorfulTile({this.color});

  // List colors = [Colors.red, Colors.green, Colors.yellow];
  // Random random = new Random();
  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(padding: EdgeInsets.all(80.0)),
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 70.0, bottom: 20.0),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(widget.title),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
