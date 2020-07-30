import 'package:eesand/widgets/modules/user/phone_no.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: PhoneNo(),
        ),
      ),
    );
  }
}
