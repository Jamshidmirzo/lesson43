import 'package:flutter/material.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  ValueChanged<bool> onThemeModeChanged;
   Homescreen({super.key, required this.onThemeModeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      drawer: CustomDrawer(onThemeModeChanged: onThemeModeChanged),
    );
  }
}
