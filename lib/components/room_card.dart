import 'package:flutter/material.dart';
import '../models/room.dart';
import 'room_form.dart';  // Import the room model

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

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
            onPressed: () {
              // Open the dialog for editing the room
              showDialog(
                context: context,
                builder: (context) => EditRoomDialog(room: room),
              );
            },
          ),
        ),
      ),
    );
  }
}