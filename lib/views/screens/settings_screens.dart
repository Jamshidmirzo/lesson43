import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constans.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class SettingsScreens extends StatelessWidget {
  SettingsScreens({super.key, required this.onThemeModeChanged});

  ValueChanged<bool> onThemeModeChanged;

  String themestring = 'Night Mode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting sahifa'),
      ),
      drawer: CustomDrawer(onThemeModeChanged: onThemeModeChanged),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstans.themeMode == ThemeMode.dark,
              onChanged: (value) {
                if (value == false) {
                  themestring = 'Night Mode';
                } else {
                  themestring = 'Light Mode';
                }
                onThemeModeChanged(value);
              },
              title: Text(themestring),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'App',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
