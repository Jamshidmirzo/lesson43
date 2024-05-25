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
    AppbarColor.appbarcolor = color;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppbarColor.appbarcolor,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: AppConstans.themeMode,
      debugShowCheckedModeBanner: false,
      home: Homescreen(onThemeModeChanged: changeThemeMode),
    );
  }
}
