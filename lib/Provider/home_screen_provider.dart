import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopsify/Model/item_model.dart';

import '../Model/ItemsList.dart';

class HomeScreenProvider extends ChangeNotifier {
  int quantity = 1;
  ItemsModel items = ItemsModel();
  List<ItemsModel> itemsList = [];

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  List<Map<String, String>> kartItems = [];
  HomeScreenProvider() {
    // Load quantity from secure storage during initialization
    _loadQuantity();
    getItems();
  }
  getItems() {
    List<ItemsModel> listItems =
        ItemsList.jsonData.map((item) => ItemsModel.fromJson(item)).toList();
    itemsList = listItems;
    print(itemsList);
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
