import 'package:flutter/material.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  ValueChanged<bool> onThemeModeChanged;
  ValueChanged<Color> onAppbarchanged;
  ValueChanged<Color> onbodychangecolor;
  Homescreen(
      {super.key,
      required this.onThemeModeChanged,
      required this.onAppbarchanged,required this.onbodychangecolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      drawer: CustomDrawer(
          onThemeModeChanged: onThemeModeChanged,
          onAppbarchanged: onAppbarchanged,onbodychangecolor:onbodychangecolor),
    );
  }
}
