import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constans.dart';
import 'package:lesson43/views/screens/homescreen.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Color? appbarcolor;
  changeThemeMode(bool isDark) {
    AppConstans.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  changeAppbarcolor(Color color) {
    setState(() {
      AppConstans.appbarcolor = color;
    });
  }

  changebodycolor(Color color) {
    AppConstans.bodycolor = color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppConstans.bodycolor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstans.appbarcolor,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: AppConstans.themeMode,
      debugShowCheckedModeBanner: false,
      home: Homescreen(
          onThemeModeChanged: changeThemeMode,
          onAppbarchanged: changeAppbarcolor,
          onbodychangecolor: changebodycolor),
    );
  }
}
