import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/order.dart';
import 'package:http/http.dart' as http;

class Orders with ChangeNotifier {
  List<OrderItem> _item = [];
  List<OrderItem> get item {
    return _item;
  }

  Future<void> additem({double total, List product}) async {
    const url = 'https://shopapp-94275.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'product': product
                .map((cp) => {
                      'title': cp.title,
                      'price': cp.price,
                      'id': cp.id,
                    })
                .toList(),
          }));
      _item.add(
        OrderItem(
          id: json.decode(response.body)['title'],
          amount: total,
          product: product,
          dateTime: timeStamp,
        ),
      );
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchAndSetOrders() async {
    const url = 'https://shopapp-94275.firebaseio.com/orders.json';

    final response = await http.get(url);
    final extractData = json.decode(response.body) as Map<String, dynamic>;
    final List<OrderItem> loadedList = [];
    if (extractData == null) {
      return;
    }
    extractData.forEach((orderId, orderData) {
      loadedList.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          product: (orderData['product'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    });
    _item = loadedList.toList();
    notifyListeners();
  }
}
