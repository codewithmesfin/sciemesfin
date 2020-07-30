import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.school,
          ),
          onPressed: () {
            _switchWidget('school', context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.play_circle_filled,
          ),
          onPressed: () {
            _switchWidget('video', context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.library_books,
          ),
          onPressed: () {
            _switchWidget('book', context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.note_add,
          ),
          onPressed: () {
            _switchWidget('note', context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  _switchWidget(String arg, BuildContext context) {
    Navigator.pushNamed(context, '/home', arguments: arg);
  }
}
