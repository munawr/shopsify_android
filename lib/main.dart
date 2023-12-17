import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicify_user/Provider/order_provider.dart';
import 'view/splash_screen.dart';

void main() async{
  runApp(const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopsify',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}