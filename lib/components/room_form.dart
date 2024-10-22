import 'package:flutter/material.dart';
import '../models/room.dart';
import 'room_task_dialog.dart';  // Import the room model

class AddRoomDialog extends StatefulWidget {
  @override
  _AddRoomDialogState createState() => _AddRoomDialogState();
}

class _AddRoomDialogState extends State<AddRoomDialog> {
  String roomType = 'Standard';
  String roomStatus = 'Vacant';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add a new room"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Room Number",
                hintText: "104",
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Guest Name",
                suffixIcon: Icon(Icons.add),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Reservation",
                      hintText: "dd/mm/yyyy",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Due Time",
                      hintText: "hh:mm",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Type"),
                    value: roomType,
                    items: ['Standard', 'Suite'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        roomType = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Status"),
                    value: roomStatus,
                    items: ['Vacant', 'Occupied', 'In Service'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        roomStatus = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Checkout",
                      hintText: "dd/mm/yyyy",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Due Time",
                      hintText: "hh:mm",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
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
          child: const Text("Add"),
          onPressed: () {
            // Aquí puedes manejar la lógica para añadir la habitación
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class EditRoomDialog extends StatelessWidget {
  final Room room;

  const EditRoomDialog({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Room ${room.number}"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: room.number),
              decoration: const InputDecoration(labelText: "Room Number"),
            ),
            TextField(
              controller: TextEditingController(text: room.guests),
              decoration: const InputDecoration(labelText: "Guest Name"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Reservation",
                      hintText: "dd/mm/yyyy",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Due Time",
                      hintText: "hh:mm",
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Type"),
                    value: room.type,
                    items: ['Standard', 'Suite'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Cambiar el tipo de habitación
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Status"),
                    value: room.status,
                    items: ['Vacant', 'Occupied', 'In Service'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Cambiar el estado de la habitación
                    },
                  ),
                ),
              ],
            ),
            if (room.status == 'Vacant')
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Abre la ventana emergente para agregar una nueva tarea
                    showDialog(
                      context: context,
                      builder: (context) => RoomTaskDialog(room: room),
                    );
                  },
                  child: const Text("Add New Task"),
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
          child: const Text("Edit"),
          onPressed: () {
            // Aquí puedes manejar la lógica de edición
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}