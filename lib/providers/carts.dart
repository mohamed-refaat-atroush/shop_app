import 'cart.dart';
import 'package:flutter/cupertino.dart';

class Carts with ChangeNotifier {
  final List<CartItem> _cartsList = [];
  List<CartItem> get cartsList {
    return [..._cartsList];
  }

  void addItem(String itemId, String itemTitle, double itemPricy) {
    _cartsList.add(CartItem(id: itemId, title: itemTitle, price: itemPricy));
    notifyListeners();
  }

  int get numOfProduct {
    return _cartsList.length;
  }

  double get price {
    double sum = 0;
    _cartsList.forEach((element) {
      sum += element.price;
    });
    return sum;
  }

  void deleteItem(CartItem cart) {
    _cartsList.remove(cart);
    notifyListeners();
  }

  void deleteList() {
    _cartsList.clear();
    notifyListeners();
  }
}
