import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstans {
  static ThemeMode themeMode = ThemeMode.light;
  static Color appbarcolor = Colors.blue.shade200;
  static Color bodycolor = Colors.white;
  static String pincode1 = '';
  static String pincode2 = '';
  static String pincode3 = '';
  static String pincode4 = '';

  // void sharedpreferencesstart() async {
  //   final sharedpref = SharedPreferences.getInstance();
  // }

  static addappbarcolor(Color color) async {
    final sharedpref = await SharedPreferences.getInstance();
    String change = color.toString();
    sharedpref.setString('appbar', change);
  }
}
