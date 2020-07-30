import 'package:flutter/material.dart';

class SecondRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: width,
      padding: EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.library_books,
                  ),
                  Text(
                    "  Books",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(height: 30, child: VerticalDivider()),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Icon(Icons.video_library),
                  Text(
                    "  Videos",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Icon(Icons.layers),
                  Text(
                    "  Exams",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
