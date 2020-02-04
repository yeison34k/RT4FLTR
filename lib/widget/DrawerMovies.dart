import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerMovies extends StatelessWidget {
  BuildContext parentContext;

  DrawerMovies(BuildContext parentContext) {
    this.parentContext = parentContext;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Terminate'),
            onTap: () {
              Navigator.pop(parentContext);
            },
          )
        ]));
  }
}

