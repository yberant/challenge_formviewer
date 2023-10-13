import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageDrawer extends StatelessWidget {
  const PageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
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
