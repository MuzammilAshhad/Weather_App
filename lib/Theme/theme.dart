import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(25, 255, 255, 255),
    secondary: Colors.white,
    surface: Colors.white30,
    onPrimary: Colors.white70,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
   colorScheme: ColorScheme.dark(
    primary: Color.fromARGB(31, 0, 0, 0),
    secondary: Colors.black,
    surface: Colors.black38,
    onPrimary: Colors.black38,
  ),
);


// import 'package:flutter/material.dart';

// final lightTheme = ThemeData(
//   brightness: Brightness.light,
//   primaryColor: Colors.white,
//   scaffoldBackgroundColor: Colors.white,
//   colorScheme: const ColorScheme.light(
//     primary: Colors.white,           // bg color
//     secondary: Colors.black,         // ✅ text/icon color
//     surface: Colors.grey,            // for icons/borders
//     onPrimary: Colors.black,         // for text on primary
//   ),
// );

// final darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.black,
//   scaffoldBackgroundColor: Colors.black,
//   colorScheme: const ColorScheme.dark(
//     primary: Colors.black,           // bg color
//     secondary: Colors.white,         // ✅ text/icon color
//     surface: Colors.white60,         // for outlines/borders
//     onPrimary: Colors.white,         // for text on primary
//   ),
// );
