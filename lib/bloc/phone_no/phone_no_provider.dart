import 'package:eesand/bloc/phone_no/phone_no_bloc.dart';
import 'package:flutter/material.dart';

class PhoneNoBlocProvider extends InheritedWidget {
  final bloc = PhoneNoBloc();

  PhoneNoBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static PhoneNoBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<PhoneNoBlocProvider>())
        .bloc;
  }
}
