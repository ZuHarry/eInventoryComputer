import 'package:flutter/material.dart';
import 'package:einventorycomputer/modules/home/screen/home.dart';
import 'package:einventorycomputer/modules/home/screen/inventory.dart';
import 'package:einventorycomputer/modules/home/screen/settings.dart';
import 'package:einventorycomputer/modules/home/screen/account.dart';
import 'package:einventorycomputer/modules/authentication/screen/login.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    InventoryPage(),
    SettingsPage(),
    AccountPage(),
    LoginPage(),
  ];

  final List<String> _titles = [
    "Home",
    "Inventory",
    "Settings",
    "Account",
    "Login",
  ];

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () => _onSelect(0),
            ),
            ListTile(
              title: Text("Inventory"),
              leading: Icon(Icons.inventory),
              onTap: () => _onSelect(1),
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () => _onSelect(2),
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.person),
              onTap: () => _onSelect(3),
            ),
            ListTile(
              title: Text("Login"),
              leading: Icon(Icons.person),
              onTap: () => _onSelect(4),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
