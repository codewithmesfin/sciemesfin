import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: Icon(Icons.play_circle_filled),
            onPressed: () => Navigator.pushNamed(context, '/video'),
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.note_add),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.more),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
