import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: primary,
  primaryColorDark: white,
  primaryColorLight: white,
  fontFamily: 'Jost',
  cardColor: secondaryColor,
  dialogBackgroundColor: secondaryColor,
  scaffoldBackgroundColor: secondaryColor,
  cardTheme: const CardTheme(color: secondaryColor),
  iconTheme: const IconThemeData(color: primaryColor),
  buttonTheme: const ButtonThemeData(buttonColor: primaryColor),
  listTileTheme: const ListTileThemeData(iconColor: primaryColor),
  dialogTheme: const DialogTheme(backgroundColor: secondaryColor),
  bottomAppBarTheme: const BottomAppBarTheme(color: primaryColor),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
  dividerTheme: DividerThemeData(color: primaryColor.withOpacity(0.15), thickness: 1),
  appBarTheme: const AppBarTheme(backgroundColor: primaryColor, centerTitle: false, elevation: 0),
  popupMenuTheme: const PopupMenuThemeData(color: secondaryColor, textStyle: TextStyle(color: black)),
  datePickerTheme: const DatePickerThemeData(backgroundColor: secondaryColor, headerBackgroundColor: blue),
  tabBarTheme: const TabBarTheme(labelStyle: TextStyle(fontSize: 16), unselectedLabelStyle: TextStyle(fontSize: 14)),
  textTheme: const TextTheme(bodySmall: TextStyle(letterSpacing: 0.5), bodyMedium: TextStyle(letterSpacing: 0.5), bodyLarge: TextStyle(letterSpacing: 0.5)),
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: grey,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: white),
    padding: EdgeInsets.all(10),
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: black),
    checkColor: MaterialStateProperty.all<Color>(white),
    fillColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return white;
      },
    ),
  ),
).copyWith(
  canvasColor: secondaryColor,
  scaffoldBackgroundColor: backgroundColor,
);
