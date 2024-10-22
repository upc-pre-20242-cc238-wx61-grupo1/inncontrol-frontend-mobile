import 'package:flutter/material.dart';
import '../../components/room_card.dart';  // Import the room card widget
import '../../components/room_form.dart'; // Import the room form widgets
import '../../models/room.dart';  // Import the room model

class RoomListScreen extends StatelessWidget {
  final List<Room> rooms = [
    Room(
      number: '102',
      type: 'Standard',
      status: 'Occupied',
      guests: 'John Doe, Jane Doe',
      upcomingReservations: '10/05/2024 - 03/06/2024',
    ),
    Room(
      number: '103',
      type: 'Standard',
      status: 'Vacant',
      guests: 'Jane Charles',
      upcomingReservations: '10/05/2024 - 03/06/2024',
    ),
    Room(
      number: '104',
      type: 'Standard',
      status: 'In Service',
      guests: 'None',
      upcomingReservations: 'None',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();  // This opens the drawer
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () {
                      // Open the dialog for adding a new room
                      showDialog(
                        context: context,
                        builder: (context) => AddRoomDialog(),
                      );
                    },
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return RoomCard(room: room);  // Use the room card component
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}