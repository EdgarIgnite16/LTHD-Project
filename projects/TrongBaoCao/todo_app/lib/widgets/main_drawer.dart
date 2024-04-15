import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';
import '../screens/delete_screen.dart';

import '../constrants/colors.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: tdBlack,
            ),
            child: Text(
              'ToDo App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home, color: tdLPur),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(appBarTitle: 'Home')));
            },
          ),
          ListTile(
            title: const Text('Delete'),
            leading: const Icon(Icons.delete, color: tdLPur),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeleteScreen(appBarTitle: 'Delete')));
            },
          ),
          const ListTile(
            title: Text('Setting'),
            leading: Icon(Icons.settings, color: tdLPur),
          ),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.logout, color: tdLPur),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
