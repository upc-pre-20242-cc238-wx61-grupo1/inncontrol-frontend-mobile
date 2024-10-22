import 'package:flutter/material.dart';
import '../models/room.dart';  // Import the room model

class RoomTaskDialog extends StatefulWidget {
  final Room room;

  const RoomTaskDialog({Key? key, required this.room}) : super(key: key);

  @override
  _RoomTaskDialogState createState() => _RoomTaskDialogState();
}

class _RoomTaskDialogState extends State<RoomTaskDialog> {
  String taskStatus = 'Done';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Room ${widget.room.number}"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Task Description",
                hintText: "Describe the task",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Date",
                      hintText: "dd/mm/yyyy",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Time",
                      hintText: "hh:mm",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Task Status"),
              value: taskStatus,
              items: ['Done', 'Pending', 'In Progress'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  taskStatus = newValue!;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: "Assigned To",
                hintText: "Enter staff name",
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            // Show task assigned message
            showDialog(
              context: context,
              builder: (context) => TaskAssignedDialog(),
            );
          },
        ),
      ],
    );
  }
}

class TaskAssignedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Room 101"),  // This assumes room number is accessible here
      content: const Text("Task Assigned!"),
      actions: <Widget>[
        TextButton(
          child: const Text("Edit"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}