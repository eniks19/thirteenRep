import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List _shopItems = [
    [
      'Avocado',
      '4.00',
      'https://github.com/mitchkoko/GroceryStoreApp/blob/main/lib/images/avocado.png?raw=true',
      Colors.green
    ],
    [
      'Banana',
      '2.50',
      'https://github.com/mitchkoko/GroceryStoreApp/blob/main/lib/images/banana.png?raw=true',
      Colors.yellow
    ],
    [
      'Chicken',
      '12.80',
      'https://github.com/mitchkoko/GroceryStoreApp/blob/main/lib/images/chicken.png?raw=true',
      Colors.brown
    ],
    [
      'Water',
      '1.00',
      'https://github.com/mitchkoko/GroceryStoreApp/blob/main/lib/images/water.png?raw=true',
      Colors.blue
    ],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.remove(_shopItems[index]);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
