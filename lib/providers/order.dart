import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> product;
  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.dateTime,
      @required this.product});
}
