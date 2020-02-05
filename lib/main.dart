import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';
import 'package:pelis/widget/DrawerMovies.dart';
import 'package:pelis/widget/mediaList.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: "Pelis",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.media}) : super(key: key);
  final String title;
  final MediaType media;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ]),
      drawer: DrawerMovies(context),
      body: PageView(
        children: <Widget>[
          MediaList(media: widget.media),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text("¡Que cuca!")),
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_down), title: Text("¡Uy que gonorrea!")),
    ];
  }
}
