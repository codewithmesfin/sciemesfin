import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget title;
  Loading({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: title,
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              value: null,
            ),
          ),
        ],
      ),
    );
  }
}
