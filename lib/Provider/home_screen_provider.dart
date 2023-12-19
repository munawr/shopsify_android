import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreenProvider extends ChangeNotifier {
  int quantity = 1;
  // final GoRouter router = GoRouter(
  //   routes: [
  //     GoRoute(
  //       path: '/',
  //       builder: (context, state) => const HomeScreen(),
  //     ),
  //     GoRoute(
  //       path: '/Home',
  //       builder: (context, state) => const HomeScreen(),
  //     ),
  //     GoRoute(
  //       path: '/Kart',
  //       builder: (context, state) => const KartScreen(),
  //     ),
  //   ],
  // );

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  List<Map<String, String>> kartItems = [];
  HomeScreenProvider() {
    // Load quantity from secure storage during initialization
    _loadQuantity();
  }

  addToKart(String? name, String? image, String? price, String? bestSeller) {
    // Add the item to the Kart
    kartItems.add({
      'name': name ?? '',
      'image': image ?? '',
      'price': price ?? '',
      'bestSeller': bestSeller ?? '',
    });

    // Save the Kart items to secure storage (optional)
    _saveKartItems();

    notifyListeners();
  }
  _saveKartItems() async {
    await _secureStorage.write(key: 'kartItems', value: json.encode(kartItems));
  }

  _loadQuantity() async {
    String? storedQuantity = await _secureStorage.read(key: 'quantity');
    if (storedQuantity != null) {
      quantity = int.parse(storedQuantity);
      notifyListeners();
    }
  }

  _saveQuantity() async {
    await _secureStorage.write(key: 'quantity', value: quantity.toString());
  }

  quantityDecrement() {
    if (quantity > 1) {
      quantity--;
      _saveQuantity();
      notifyListeners();
    }
  }

  quantityIncrement() {
    quantity++;
    _saveQuantity();
    notifyListeners();
  }

  onRefresh() {
    notifyListeners();
  }
}
