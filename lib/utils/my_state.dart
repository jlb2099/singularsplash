import 'package:flutter/material.dart';
import 'package:singularsplash/utils/pref_manager.dart';

class ThemeState extends ChangeNotifier {
  int currentThemeIndex = 0;
  ThemeMode currentThemeMode = ThemeMode.light;
  List<ThemeMode> _themeModes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system
  ];
  void getTheme() async {
    currentThemeIndex = await PrefManager().getThemeIndex();
    currentThemeMode = _themeModes[currentThemeIndex];
    currentAccentIndex = await PrefManager().getAccentIndex();
    currentAccent = accentColors[currentAccentIndex];
    notifyListeners();
  }

  changeThemeMode(index) {
    currentThemeMode = _themeModes[index];
    currentThemeIndex = index;
    notifyListeners();
    PrefManager().saveThemeIndex(index);
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: currentAccent,
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: currentAccent,
    );
  }

  // For Accent colors
  int currentAccentIndex = 0;
  List<Color> accentColors = [
    Colors.amber,
    Colors.purple,
    Colors.cyan,
    Colors.greenAccent,
    Colors.lime,
    Colors.redAccent
  ];
  List<Text> accentTexts = [
    Text("Amber"),
    Text("Purple"),
    Text("Cyan"),
    Text("Green Accent"),
    Text("Lime"),
    Text("Red Accent")
  ];
  Color currentAccent = Colors.amber;

  changeAccent(index) {
    currentAccent = accentColors[index];
    currentAccentIndex = index;
    notifyListeners();
    PrefManager().saveAccentIndex(index);
  }
}

class PageState extends ChangeNotifier {
  int currentPage = 0;

  changePage(index) {
    currentPage = index;
    notifyListeners();
  }
}
