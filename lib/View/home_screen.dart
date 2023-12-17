import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/View/Widgets/CustomAppBar.dart';
import 'package:shopsify/View/Widgets/ItemsView.dart';
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
          appBar: CustomAppBar(),
          body: GridView.count(
            crossAxisCount: 2, // Two columns
            childAspectRatio: 0.7, // Adjust height to width ratio
            mainAxisSpacing: 10, // Spacing between rows
            crossAxisSpacing: 10, // Spacing between columns
            padding: const EdgeInsets.all(10), // Padding around the grid
            children: List.generate(6, (index) {

              //final product = products[index];
              return Items(); // Build your product card widget
            }),
          ));
      }),
    );
  }
}
