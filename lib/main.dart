import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kdarkTheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main()
//  SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]).then((fn)
{
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kdarkTheme,
      cardTheme: CardTheme().copyWith(
        color: kdarkTheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kdarkTheme.primaryContainer,
            foregroundColor: kdarkTheme.onPrimaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorscheme,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorscheme.onPrimaryContainer,
          foregroundColor: kColorscheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
        color: kColorscheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorscheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 20,
              color: kColorscheme.onSecondaryContainer,
            ),
          ),
    ),
    home: Expenses(),
  ));
  // );
}
