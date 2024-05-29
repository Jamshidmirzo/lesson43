import 'package:flutter/material.dart';
import 'package:lesson43/views/screens/homescreen.dart';
import 'package:lesson43/views/screens/settings_screens.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  
  ValueChanged<Color> onAppbarchanged;
  ValueChanged<Color> onbodychangecolor;
  CustomDrawer(
      {super.key,
    
      required this.onAppbarchanged,required this.onbodychangecolor});
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
                      return Homescreen(
                      
                          onAppbarchanged: onAppbarchanged,onbodychangecolor :onbodychangecolor);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.chevron_right)),
          ListTile(
              title:  Text('Setting Sahifa'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return SettingsScreens(
                          
                          onAppbarchanged: onAppbarchanged,onbodychangecolor:onbodychangecolor);
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
