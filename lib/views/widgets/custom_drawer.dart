import 'package:flutter/material.dart';
import 'package:lesson43/views/screens/homescreen.dart';
import 'package:lesson43/views/screens/settings_screens.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
 ValueChanged<bool> onThemeModeChanged;
   CustomDrawer({super.key,required this.onThemeModeChanged});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Menu'),
            backgroundColor: Colors.blue.shade200,
          ),
          ListTile(
              title: const Text(
                'Bosh Sahifa',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return  Homescreen(onThemeModeChanged :onThemeModeChanged);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.chevron_right)),
          ListTile(
              title: const Text('Setting Sahifa'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return  SettingsScreens(onThemeModeChanged : onThemeModeChanged);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right)),
            
        ],
      ),
    );
  }
}
