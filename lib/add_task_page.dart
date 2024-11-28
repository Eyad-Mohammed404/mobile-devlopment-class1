import 'package:flutter/material.dart';
import 'task.dart';

class AddTaskPage extends StatelessWidget {
  final Function(Task) onAddTask;

  AddTaskPage({Key? key, required this.onAddTask}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void submitTask(BuildContext context) {
    final title = titleController.text;
    final description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      onAddTask(Task(title: title, description: description));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Task Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => submitTask(context),
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}