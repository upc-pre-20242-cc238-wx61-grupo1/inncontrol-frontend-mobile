import 'package:flutter/material.dart';
import '../../models/task.dart';  // Import the Task model

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  // Constructor para recibir la tarea
  TaskDetailsScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Fecha límite: ${task.dueDate}'),
            SizedBox(height: 8),
            Text('Empleado asignado: ${task.assignedEmployee}'),
            SizedBox(height: 8),
            Text('Estado: ${task.status}'),
          ],
        ),
      ),
    );
  }
}
