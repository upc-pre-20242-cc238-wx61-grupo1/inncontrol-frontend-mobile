import 'package:flutter/material.dart';
import '../views/rooms/rooms_list_screen.dart';  // Import RoomsPage
import '../views/tasks/task_list_screen.dart';  // Import TaskListScreen
import '../views/inventory/inventory_screen.dart';  // Import InventoryScreen

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Define a list of views (pages) for navigation
  static List<Widget> _pages = <Widget>[
    RoomListScreen(),  // Room view
    TaskListScreen(),  // Task view
    InventoryScreen(),  // Inventory view
  ];

  // Method to handle the navigation to the selected page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InnControl'),
      ),
      drawer: Drawer(  // Navigation Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'InnControl',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.meeting_room),
              title: Text('Rooms'),
              onTap: () {
                _onItemTapped(0);  // Navigate to RoomsPage
                Navigator.pop(context);  // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('Tasks'),
              onTap: () {
                _onItemTapped(1);  // Navigate to TaskListScreen
                Navigator.pop(context);  // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('Iventory'),
              onTap: () {
                _onItemTapped(2);  // Navigate to TaskListScreen
                Navigator.pop(context);  // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],  // Display the selected view
    );
  }
}