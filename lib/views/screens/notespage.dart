import 'package:flutter/material.dart';
import 'package:lesson43/controllers/notecontroller.dart';
import 'package:lesson43/views/widgets/notesdialog.dart';

class Notespage extends StatefulWidget {
  const Notespage({super.key});

  @override
  State<Notespage> createState() => _NotespageState();
}

class _NotespageState extends State<Notespage> {
  final noteController = Notecontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Title app',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = await showDialog(
            context: context,
            builder: (context) {
              return Notesdialog();
            },
          );
          if (note != null) {
            noteController.adddtask(
                note['id'], note['descrption'], note['title'], note['date']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: noteController.list.length,
              itemBuilder: (context, index) {
                final notes = noteController.list[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            notes.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                        ),
                        Text(notes.content),
                        Text('${notes.CreatedTime}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
