import 'package:flutter/material.dart';
import '../../components/room_card.dart'; // Import the room card widget
import '../../components/room_form.dart'; // Import the room form widgets
import '../../models/room.dart'; // Import the room model

class RoomListScreen extends StatefulWidget {
  const RoomListScreen({super.key});

  @override
  RoomListScreenState createState() => RoomListScreenState();
}

class RoomListScreenState extends State<RoomListScreen> {
  final List<Room> rooms = [];

  // Function to add a new room to the list
  void _addRoom(Room room) {
    setState(() {
      rooms.add(room); // Add the new room to the list
    });
  }

  // Function to update a room in the list
  void _updateRoom(Room updatedRoom) {
    setState(() {
      final index =
          rooms.indexWhere((room) => room.number == updatedRoom.number);
      if (index != -1) {
        rooms[index] = updatedRoom; // Update the room in the list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Rooms',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () async {
                      // Open the dialog for adding a new room and get the result
                      final Room? newRoom = await showDialog(
                        context: context,
                        builder: (context) => const RoomFormDialog(),
                      );

                      // If a new room was returned, add it to the list
                      if (newRoom != null) {
                        _addRoom(newRoom);
                      }
                    },
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: rooms.isEmpty
                  ? const Center(child: Text('No rooms added yet!'))
                  : ListView.builder(
                      itemCount: rooms.length,
                      itemBuilder: (context, index) {
                        final room = rooms[index];
                        return RoomCard(room: room, onRoomUpdated: _updateRoom);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
