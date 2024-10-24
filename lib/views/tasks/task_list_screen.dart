import 'package:flutter/material.dart';
import '../../models/task.dart'; // Import the Task model
import 'add_task_screen.dart'; // Import AddTaskScreen widget
import 'tasks_details_screen.dart'; // Import TaskDetailsScreen widget

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Lista de tareas
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

  // Función para añadir una nueva tarea
  void _addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  // Función para editar una tarea en una ventana emergente
  void _editTask(Task task) {
    TextEditingController titleController =
        TextEditingController(text: task.title);
    TextEditingController dueDateController =
        TextEditingController(text: task.dueDate);
    TextEditingController assignedEmployeeController =
        TextEditingController(text: task.assignedEmployee);
    TextEditingController statusController =
        TextEditingController(text: task.status);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: dueDateController,
                decoration: InputDecoration(labelText: 'Fecha límite'),
              ),
              TextField(
                controller: assignedEmployeeController,
                decoration: InputDecoration(labelText: 'Empleado asignado'),
              ),
              TextField(
                controller: statusController,
                decoration: InputDecoration(labelText: 'Estado'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo sin guardar
              },
            ),
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                setState(() {
                  // Crear un nuevo objeto Task con los valores actualizados
                  final editedTask = Task(
                    title: titleController.text,
                    dueDate: dueDateController.text,
                    assignedEmployee: assignedEmployeeController.text,
                    status: statusController.text,
                  );

                  // Actualizar la lista de tareas, reemplazando la tarea editada
                  int taskIndex = tasks.indexOf(task);
                  tasks[taskIndex] = editedTask;
                });
                Navigator.of(context)
                    .pop(); // Cerrar el cuadro de diálogo después de guardar
              },
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar el cuadro de diálogo de confirmación antes de eliminar
  void _confirmDeleteTask(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text(
              '¿Estás seguro de que deseas eliminar la tarea "${task.title}"?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
            ),
            TextButton(
              child: Text('Sí'),
              onPressed: () {
                _deleteTask(task);
                Navigator.of(context)
                    .pop(); // Cerrar el cuadro de diálogo después de eliminar
              },
            ),
          ],
        );
      },
    );
  }

  // Función para eliminar una tarea
  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Aquí puedes agregar lógica de filtrado si es necesario
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla para añadir una nueva tarea
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
          return ListTile(
            title: Text(task.title),
            subtitle: Text('${task.dueDate} | ${task.status}'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _editTask(task); // Mostrar cuadro de diálogo para editar
                } else if (value == 'delete') {
                  _confirmDeleteTask(
                      task); // Mostrar cuadro de diálogo antes de eliminar
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Editar'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Eliminar'),
                  ),
                ];
              },
            ),
            onTap: () {
              // Navegar a la pantalla de detalles de la tarea
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailsScreen(task: task),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
