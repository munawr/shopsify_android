import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/View/Widgets/CustomAppBar.dart';
import 'package:shopsify/View/Widgets/ItemsView.dart';
import '../../Provider/home_screen_provider.dart';
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(builder: (context, data, _) {
        return FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/watches_data.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<dynamic> watchData = json.decode(snapshot.data.toString());
              List<Widget> rows = [];
              for (int i = 0; i < watchData.length; i += 2) {
                List<Widget> rowChildren = [];
                for (int j = 0; j < 2 && (i + j) < watchData.length; j++) {
                  rowChildren.add(
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomItems(
                          bestSeller: watchData[i + j]['bestSeller'],
                          dealOfTheDay: watchData[i + j]['dealOfTheDay'],
                          name: watchData[i + j]['name'],
                          image: watchData[i + j]['image'],
                          offer: watchData[i + j]['offer'],
                        ),
                      ),
                    ),
                  );
                }
                rows.add(
                  Row(
                    children: rowChildren,
                  ),
                );
              }

              return Scaffold(
                backgroundColor: Colors.grey,
                appBar: const CustomAppBar(),
                body: ListView(
                  children: rows,
                ),
              );
            } else {
              return const Scaffold(
                backgroundColor: Colors.grey,
                appBar: CustomAppBar(),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
