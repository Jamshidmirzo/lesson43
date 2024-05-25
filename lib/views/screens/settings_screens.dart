import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lesson43/utils/app_constans.dart';
import 'package:lesson43/views/screens/pincode_page.dart';
import 'package:lesson43/views/screens/quitpage.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

class SettingsScreens extends StatefulWidget {
  SettingsScreens(
      {super.key,
      required this.onThemeModeChanged,
      required this.onAppbarchanged,
      required this.onbodychangecolor});

  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> onbodychangecolor;
  final ValueChanged<Color> onAppbarchanged;

  @override
  _SettingsScreensState createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  String themestring = 'Night Mode';
  Color appBarColor = Colors.red;
  Color bodycolor = Colors.white;

  @override
  void initState() {
    super.initState();

    appBarColor = AppConstans.appbarcolor;
    bodycolor = AppConstans.bodycolor;
  }

  void buildColorpicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: bodycolor,
              onColorChanged: (Color color) {
                setState(() {
                  bodycolor = color;
                });
                widget.onbodychangecolor(color);
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done✅'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bodycolorpicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: appBarColor,
              onColorChanged: (Color color) {
                setState(() {
                  appBarColor = color;
                });
                widget.onAppbarchanged(color);
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done✅'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting sahifa'),
        backgroundColor: appBarColor,
      ),
      drawer: CustomDrawer(
          onbodychangecolor: widget.onbodychangecolor,
          onThemeModeChanged: widget.onThemeModeChanged,
          onAppbarchanged: widget.onAppbarchanged),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstans.themeMode == ThemeMode.dark,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    themestring = 'Light Mode';
                    AppConstans.themeMode = ThemeMode.light;
                  } else {
                    themestring = 'Night Mode';
                    AppConstans.themeMode = ThemeMode.dark;
                  }
                });
                widget.onThemeModeChanged(value);
              },
              title: Text(themestring),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                buildColorpicker(context);
              },
              child: const Text(
                'Tap to change color of Body',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                bodycolorpicker(context);
              },
              child: const Text(
                'Tap to change color of Appbar',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return PincodePage();
                    },
                  ),
                );
              },
              child: const Text(
                'Add Pin code',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return Quitpage(
                          pincode1: AppConstans.pincode1,
                          pincode2: AppConstans.pincode2,
                          pincode3: AppConstans.pincode3,
                          pincode4: AppConstans.pincode4,
                        );
                      },
                    ),
                  );
                },
                child: Text('Quit'))
          ],
        ),
      ),
    );
  }
}
