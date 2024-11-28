import 'package:flutter/material.dart';
import 'add_task_page.dart';
import 'task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: const Color.fromARGB(255, 243, 245, 249), // لون خلفية شريط التطبيق
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              '${index + 1}.',
              style: TextStyle(color: const Color.fromARGB(255, 42, 44, 46)), // لون الرقم
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tasks[index].title,
                  style: TextStyle(
                    color: tasks[index].isCompleted ? Colors.green : Colors.black87, // لون النص
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (tasks[index].isCompleted)
                  Icon(Icons.check, color: const Color.fromARGB(255, 216, 225, 217)), // لون الأيقونة
              ],
            ),
            subtitle: Text(
              tasks[index].description,
              style: TextStyle(color: const Color.fromARGB(255, 224, 172, 172)), // لون النص الفرعي
            ),
            onTap: () {
              setState(() {
                tasks[index].isCompleted = !tasks[index].isCompleted;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTaskPage(onAddTask: addTask),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 131, 134, 139), // لون زر الإضافة
      ),
    );
  }
}