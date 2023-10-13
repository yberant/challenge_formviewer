import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageDrawer extends StatelessWidget {
  const PageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: screenHeight * 0.11,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('FormViewer'),
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).pushReplacement("/home");
            },
          ),
          ListTile(
            title: const Text('Formulario'),
            onTap: () async {
              Navigator.pop(context); //desactivo el drawe
              GoRouter.of(context).push("/form");
            },
          ),
          ListTile(
            title: const Text('Opcion 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Opcion 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
