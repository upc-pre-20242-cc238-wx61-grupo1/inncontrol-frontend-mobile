import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomFormDialog extends StatefulWidget {
  final Room? room;  // Optional room for editing

  const RoomFormDialog({super.key, this.room});

  @override
  RoomFormDialogState createState() => RoomFormDialogState();
}

class RoomFormDialogState extends State<RoomFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _roomNumber;
  String? _roomType = 'Standard';  // Default room type
  String? _roomStatus = 'Vacant';  // Default room status
  String? _guests = 'None';
  String? _upcomingReservations = 'None';

  @override
  void initState() {
    super.initState();

    // If a room is passed for editing, pre-fill the fields
    if (widget.room != null) {
      _roomNumber = widget.room!.number;
      _roomType = widget.room!.type;
      _roomStatus = widget.room!.status;
      _guests = widget.room!.guests;
      _upcomingReservations = widget.room!.upcomingReservations;
    } else {
      // Default values for adding a new room
      _roomType = 'Standard';
      _roomStatus = 'Vacant';
      _guests = 'None';
      _upcomingReservations = 'None';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.room == null ? 'Add a New Room' : 'Edit Room ${_roomNumber}'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _roomNumber,
                decoration: const InputDecoration(labelText: 'Room Number'),
                onSaved: (value) {
                  print('El valor actual de _roomNumber es: $value');
                  _roomNumber = value;
                },
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Please enter a room number'
                      : null;
                },
              ),
              TextFormField(
                initialValue: _guests,
                decoration: const InputDecoration(labelText: 'Guests'),
                onSaved: (value) {
                  _guests = value ?? 'None';
                },
              ),
              TextFormField(
                initialValue: _upcomingReservations,
                decoration: const InputDecoration(labelText: 'Upcoming Reservations'),
                onSaved: (value) {
                  _upcomingReservations = value ?? 'None';
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Room Type'),
                value: _roomType,
                items: ['Standard', 'Suite'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _roomType = newValue;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Room Status'),
                value: _roomStatus,
                items: ['Vacant', 'Occupied', 'In Service'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _roomStatus = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(widget.room == null ? 'Add' : 'Update'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              // Create or update a Room object
              final updatedRoom = Room(
                number: _roomNumber!,
                type: _roomType!,
                status: _roomStatus!,
                guests: _guests!,
                upcomingReservations: _upcomingReservations!,
              );

              // Return the room data to the main screen
              Navigator.of(context).pop(updatedRoom);
            }
          },
        ),
      ],
    );
  }
}