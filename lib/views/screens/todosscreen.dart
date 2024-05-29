import 'package:flutter/material.dart';
import 'package:lesson43/controllers/todo_controller.dart';
import 'package:lesson43/views/widgets/todoswidget.dart';

class Todosscreen extends StatefulWidget {
  const Todosscreen({super.key});

  @override
  State<Todosscreen> createState() => _TodosscreenState();
}

class _TodosscreenState extends State<Todosscreen> {
  final todosContorller = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final tasks = await showDialog(
            context: context,
            builder: (context) {
              return Todoswidget();
            },
          );
          if (tasks != null) {
            todosContorller.adddtask(tasks['id'], tasks['descrption'],
                tasks['title'], tasks['date']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: todosContorller.list.length,
                itemBuilder: (context, index) {
                  final todos = todosContorller.list[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              todos.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                          ),
                          Text(todos.description),
                          Text('${todos.date}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
