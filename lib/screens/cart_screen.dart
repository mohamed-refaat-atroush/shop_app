import 'package:flutter/material.dart';
import 'package:shop_app/widget/cartConst.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: CartConst(),
    );
  }
}
