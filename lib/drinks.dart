import 'package:flutter/foundation.dart';

class Drinks with ChangeNotifier {
  static const List<Map<String, dynamic>> _drink_data = [
    {
      'name': 'Spezi',
      'price': 13.55,
      'pfand': 3.1,
    },
    {
      'name': 'Mate',
      'price': 13.15,
      'pfand': 4.5,
    },
    {
      'name': 'Augustiner',
      'price': 16.45,
      'pfand': 3.1,
    },
    {
      'name': 'Tegernseer',
      'price': 19.4,
      'pfand': 3.1,
    },
    {
      'name': 'Adelholzener',
      'price': 9.6,
      'pfand': 3.3,
    },
    {
      'name': 'RedBull',
      'price': 1.75,
      'pfand': 0.25,
    },
  ];

  List<Map<String, dynamic>> _drinks = _drink_data
      .map((drink) => {...drink, 'quantity': 0, 'pfand_quantity': 0})
      .toList();

  List<Map<String, dynamic>> get drinks {
    return [..._drinks];
  }

  void addDrink(int index, {bool isPfand = false}) {
    String quantityKey = isPfand ? 'pfand_quantity' : 'quantity';
    _drinks[index][quantityKey] += 1;
    notifyListeners();
  }

  void removeDrink(int index, {bool isPfand = false}) {
    String quantityKey = isPfand ? 'pfand_quantity' : 'quantity';
    if (_drinks[index][quantityKey] > 0) {
      _drinks[index][quantityKey] -= 1;
    }
    notifyListeners();
  }

  void clear() {
    _drinks = _drink_data
        .map((drink) => {...drink, 'quantity': 0, 'pfand_quantity': 0})
        .toList();
    notifyListeners();
  }

  double get totalAmount {
    if (_drinks == null) return 0.0;
    double total = 0;
    _drinks.forEach((drink) {
      total += (drink['price'] + drink['pfand']) * drink['quantity'];
      total -= drink['pfand'] * drink['pfand_quantity'];
    });
    return total;
  }

  String get totalAmountString {
    return '${totalAmount.toStringAsFixed(2)} €';
  }
}
