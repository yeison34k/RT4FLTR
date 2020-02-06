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
      home: MyHomePage(
        title: "Pelis",
      ),
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
  int _page = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        children: _getMediaList(), //_getMediaList(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: _navigationTapped(_page),
        items: _getFooterItems(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text("¡Las mas cucas!")),
      BottomNavigationBarItem(
          icon: Icon(Icons.autorenew), title: Text("¡Las melas!")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("¡Y las de todos!"))
    ];
  }

  _navigationTapped(int page) {
    if( _pageController.hasClients ) {
      _pageController.animateToPage(page,
      duration: const Duration(milliseconds: 300), curve: Curves.elasticOut);
    }

  }

  List<Widget> _getMediaList() {
    return  widget.media == MediaType.movie ? <Widget>[
      MediaList(widget.media, type: "popular"),
      MediaList(widget.media, type: "upcoming"),
      MediaList(widget.media, type: "top_rated"),
    ] : <Widget>[
      MediaList(widget.media, type: "popular"),
      MediaList(widget.media, type: "on_the_air"),
      MediaList(widget.media, type: "top_rated")
    ];
  }
}
