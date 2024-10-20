import 'package:flutter/material.dart';
import '../models/task.dart';  // Import the Task model

class TaskItem extends StatelessWidget {
  final Task task;  // Use the Task model instead of individual fields

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(task.title),  // Use task.title
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Due Date: ${task.dueDate}"),  // Use task.dueDate
            Text("Assigned Employee: ${task.assignedEmployee}"),  // Use task.assignedEmployee
            Text("Status: ${task.status}"),  // Use task.status
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}