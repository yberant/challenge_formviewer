import 'package:flutter/material.dart';
import 'package:formviewer/view/pages/form_page.dart';
import 'package:formviewer/view/pages/home_page.dart';
import 'package:formviewer/view/pages/result_page.dart';
import 'package:go_router/go_router.dart';

GoRouter goRoutes = GoRouter(initialLocation: "/home", routes: [
  GoRoute(path: "/home", builder: (context, state) => const HomePage()),
  GoRoute(path: "/form", builder: (context, state) => const FormPage()),
  GoRoute(path: "/result", builder: (context, state) => const ResultPage())
]);
