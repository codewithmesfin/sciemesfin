import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'NOT FOUND PAGE',
                style: TextStyle(color: Colors.red),
              ),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.green,
                child: Text("Go back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
