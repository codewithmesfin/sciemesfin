import 'package:eesand/bloc/phone_no/phone_no_bloc.dart';
import 'package:eesand/bloc/phone_no/phone_no_provider.dart';
import 'package:eesand/shared/Loading.dart';
import 'package:eesand/widgets/modules/Home.dart';
import 'package:eesand/widgets/modules/user/Signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Theme.of(context).accentColorBrightness,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).accentColorBrightness,
      ),
    );
    final PhoneNoBloc auth = PhoneNoBlocProvider.of(context);
    return StreamBuilder<String>(
        stream: auth.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool isLoggedIn = snapshot.hasData;
            return isLoggedIn ? Home() : Signin();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return _buildWaitingScreen();
            default:
              return snapshot.hasData ? Home() : Signin();
          }
        });
  }

  Widget _buildWaitingScreen() {
    return SafeArea(
      child: Scaffold(
        body: Loading(
          title: Text(
            'Autlify',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
