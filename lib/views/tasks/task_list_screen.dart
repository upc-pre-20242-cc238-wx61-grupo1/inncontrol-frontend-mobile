import 'package:flutter/material.dart';
import '../../components/task_item.dart';  // Import TaskItem widget
import '../../models/task.dart';  // Import the Task model
import 'add_task_screen.dart';  // Import AddTaskScreen widget

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Replace List<Map<String, String>> with List<Task>
  List<Task> tasks = [
    Task(
      title: 'Lorem 1',
      dueDate: '13/05/2024 | 3:40pm',
      assignedEmployee: 'Alex Huertas',
      status: 'Doing',
    ),
    Task(
      title: 'Lorem 2',
      dueDate: '13/05/2024 | 3:22pm',
      assignedEmployee: 'Alex Smith',
      status: 'To-Do',
    ),
  ];

  // Replace _addTask with a Task type parameter
  void _addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Add filtering logic here
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onAddTask: _addTask),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: tasks.map((task) {
          return TaskItem(
            task: task,  // Pass the Task object directly
          );
        }).toList(),
      ),
    );
  }
}