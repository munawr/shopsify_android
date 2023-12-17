import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../View/home_screen.dart';

class HomeScreenProvider extends ChangeNotifier {

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      // GoRoute(
      //   path: '/settings',
      //   builder: (context, state) => SettingsPage(),
      // ),
    ],
  );
}
