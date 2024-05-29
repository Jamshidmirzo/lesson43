import 'package:flutter/material.dart';

class Todoswidget extends StatelessWidget {
  Todoswidget({super.key});
  String title = '';
  String desscription = '';
  int id = 0;
  bool isCompleted = false;
  DateTime date = DateTime.now();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add task'),
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const SizedBox(
              height: 15,
            ),
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
          ],
        ),
      ),
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
                'isCompleted': isCompleted
              });
            }
          },
          child: Text("Done✅"),
        ),
      ],
    );
  }
}
