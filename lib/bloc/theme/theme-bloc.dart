import 'package:rxdart/rxdart.dart';

class ThemeBloc {
  final _themeController = BehaviorSubject<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;

  void dispose() async {
    await _themeController.drain();
    _themeController.close();
  }
}

final themeBloc = ThemeBloc();
