import 'package:flutter/material.dart';
import '../models/room.dart';
import 'room_form.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final Function(Room) onRoomUpdated;  // Callback to update room data

  const RoomCard({super.key, required this.room, required this.onRoomUpdated});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Completely square borders
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            'Room ${room.number}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue[800],
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Type: ${room.type}'),
              Text('Status: ${room.status}'),
              Text('Guests: ${room.guests}'),
              Text('Upcoming Reservations: ${room.upcomingReservations}'),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () async {
              // Open the dialog for editing the room
              final updatedRoom = await showDialog<Room>(
                context: context,
                builder: (context) => RoomFormDialog(room: room),  // Pass the room to the form
              );

              // If the room was updated, call the callback
              if (updatedRoom != null) {
                onRoomUpdated(updatedRoom);
              }
            },
          ),
        ),
      ),
    );
  }
}