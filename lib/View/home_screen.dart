import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(builder: (context, data, _) {
        return Scaffold(
          body: Container(),
          );
      }),
    );
  }
}
