import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SporAlfaTheme {
  final ThemeData _theme = ThemeData(
    fontFamily: 'Poppins-Light',
  ).copyWith(
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    primaryColor: primaryColor,
    textSelectionTheme: textSelectionTheme,
    buttonTheme: buttonTheme,
    accentColor: accentColor,
  );
  ThemeData get theme => _theme;
  static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme();
  static TextTheme get textTheme => _textTheme;
  static final AppBarTheme _appBarTheme = const AppBarTheme().copyWith(elevation: 0);
  static AppBarTheme get appBarTheme => _appBarTheme;
  static const Color _primaryColor = Color.fromRGBO(214, 94, 94, 1);
  static Color get primaryColor => _primaryColor;
  static const TextSelectionThemeData _textSelectionTheme = TextSelectionThemeData(cursorColor: Color.fromRGBO(214, 94, 94, 1));
  static TextSelectionThemeData get textSelectionTheme => _textSelectionTheme;
  static const ButtonThemeData _buttonTheme = ButtonThemeData();
  static ButtonThemeData get buttonTheme => _buttonTheme;
  static final Color _accentColor = Colors.black.withOpacity(0);
  static Color get accentColor => _accentColor;
}