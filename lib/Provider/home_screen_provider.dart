import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../View/home_screen.dart';

class HomeScreenProvider extends ChangeNotifier {
  int quantity = 1;
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  HomeScreenProvider() {
    // Load quantity from secure storage during initialization
    _loadQuantity();
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
