import 'package:flutter/material.dart';
import 'package:lesson43/controllers/settings_controller.dart';
import 'package:lesson43/portals/settings_portal.dart';
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
    return SettingsPortal(
      settingsController: SettingsController(),
      child: Builder(builder: (context) {
        return ListenableBuilder(
            listenable: SettingsPortal.of(context),
            builder: (context, child) {
              return MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: AppConstans.bodycolor,
                  appBarTheme: AppBarTheme(
                    backgroundColor: AppConstans.appbarcolor,
                  ),
                ),
                darkTheme: ThemeData.dark().copyWith(),
                themeMode: SettingsPortal.of(context).themeMode,
                debugShowCheckedModeBanner: false,
                home: Homescreen(
                    onAppbarchanged: changeAppbarcolor,
                    onbodychangecolor: changebodycolor),
              );
            });
      }),
    );
  }
}
