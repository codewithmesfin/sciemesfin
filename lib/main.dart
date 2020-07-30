import 'package:eesand/bloc/phone_no/phone_no_provider.dart';
import 'package:eesand/state/app-state-notifier.dart';
import 'package:eesand/theme/theme.dart';
import 'package:eesand/route/route.dart' as router;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      builder: (context) => AppStateNotifier(),
      child: Eesand(),
    ),
  );
}

class Eesand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return PhoneNoBlocProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            onGenerateRoute: router.generateRoute,
          ),
        );
      },
    );
  }
}
