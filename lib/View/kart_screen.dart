import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/View/Widgets/CustomAppBar.dart';
import 'package:shopsify/Provider/home_screen_provider.dart';

class KartScreen extends StatelessWidget {
  const KartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(builder: (context, data, _) {
        return FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/watches_data.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                backgroundColor: Colors.grey,
                appBar: const CustomAppBar(),
                body: ListView.builder(
                  itemCount: data.kartItems.length,
                  itemBuilder: (context, index) {
                    final item = data.kartItems[index];
                    return ListTile(
                      title: Text(item['name'] ?? ''),
                      subtitle: Text(item['price'] ?? ''),

                    );
                  },
                ),
                bottomNavigationBar: BottomNavigationBar(
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
