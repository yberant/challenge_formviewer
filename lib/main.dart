import 'package:flutter/material.dart';
import 'package:formviewer/providers/user_data_provider.dart';
import 'package:formviewer/routes.dart' as routes;

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [ChangeNotifierProvider(create: (_) => UserDataProvider())],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: routes.goRoutes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ));
  }
}
