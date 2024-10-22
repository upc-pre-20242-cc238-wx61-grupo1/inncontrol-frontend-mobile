import 'package:flutter/material.dart';
import '../../models/task.dart';  // Importar el modelo Task

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onAddTask;  // Función que recibirá la nueva tarea

  AddTaskScreen({required this.onAddTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _taskTitle;
  String? _description;
  DateTime? _dueDate;
  String? _status;
  String? _assignedEmployee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Title'),
                onSaved: (value) {
                  _taskTitle = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (value) {
                  _description = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Due Date'),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      _dueDate = picked;
                    });
                  }
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Status'),
                items: ['To-Do', 'Doing', 'Done']
                    .map((status) => DropdownMenuItem(
                  child: Text(status),
                  value: status,
                ))
                    .toList(),
                onChanged: (value) {
                  _status = value as String?;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Assigned Employee'),
                items: ['Alex Huertas', 'Alex Smith', 'Blanqui Kareli']
                    .map((employee) => DropdownMenuItem(
                  child: Text(employee),
                  value: employee,
                ))
                    .toList(),
                onChanged: (value) {
                  _assignedEmployee = value as String?;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Crear nueva tarea
                        Task newTask = Task(
                          title: _taskTitle ?? 'No Title',
                          dueDate: _dueDate != null
                              ? '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'
                              : 'No Date',
                          assignedEmployee: _assignedEmployee ?? 'No Employee',
                          status: _status ?? 'No Status',
                        );

                        // Llamar a la función para agregar la tarea
                        widget.onAddTask(newTask);  // Aquí se añade la nueva tarea

                        // Volver a la pantalla anterior
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
