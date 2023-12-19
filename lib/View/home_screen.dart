import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/View/Widgets/CustomAppBar.dart';
import 'package:shopsify/View/Widgets/ItemsView.dart';
import 'package:shopsify/Provider/home_screen_provider.dart';
import 'dart:convert';

import 'Widgets/ItemAlertBox.dart';

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
                        child: GestureDetector(
                          child: CustomItems(
                            bestSeller: watchData[i + j]['bestSeller'],
                            dealOfTheDay: watchData[i + j]['dealOfTheDay'],
                            name: watchData[i + j]['name'],
                            image: watchData[i + j]['image'],
                            offer: watchData[i + j]['offer'],
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  ItemDetailsDialog(name: watchData[i + j]['name'],
                                  image: watchData[i + j]['image'],price: watchData[i + j]['price'], bestSeller: watchData[i + j]['bestSeller'],);
                              },
                            );
                          },
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
                bottomNavigationBar:  BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'Kart',
                    ),
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      GoRouter.of(context).go('/Home');
                    } else if (index == 1) {
                      GoRouter.of(context).go('/Kart');
                    }
                  },
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
