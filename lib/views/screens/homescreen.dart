import 'package:flutter/material.dart';
import 'package:lesson43/views/screens/notespage.dart';
import 'package:lesson43/views/screens/todosscreen.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  ValueChanged<Color> onAppbarchanged;
  ValueChanged<Color> onbodychangecolor;
  Homescreen(
      {super.key,
      required this.onAppbarchanged,
      required this.onbodychangecolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      drawer: CustomDrawer(
          onAppbarchanged: onAppbarchanged,
          onbodychangecolor: onbodychangecolor),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return Todosscreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(50),
                    child: const Text('Todo App'),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return Notespage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    child: const Text('Note App'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
