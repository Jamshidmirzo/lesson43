import 'package:flutter/material.dart';

class Notesdialog extends StatefulWidget {
  const Notesdialog({super.key});

  @override
  State<Notesdialog> createState() => _NotesdialogState();
}

class _NotesdialogState extends State<Notesdialog> {
  final formkey = GlobalKey<FormState>();
  String desscription = '';
  int id = 0;
  String title = '';
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel❌"),
        ),
        ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
              Navigator.pop(context, {
                'id': id,
                'title': title,
                'descrption': desscription,
                'date': date,
              });
            }
          },
          child: Text("Done✅"),
        ),
      ],
      title: const Text('Add Notes'),
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onSaved: (newValue) {
                if (newValue != null) {
                  id = int.parse(newValue);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Error in id';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onSaved: (newValue) {
                if (newValue != null) {
                  title = newValue;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Error in title';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onSaved: (newValue) {
                if (newValue != null) {
                  desscription = newValue;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Error in descritpion';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
