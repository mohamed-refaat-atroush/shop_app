import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widget/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = '/orderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Orders>(context);
    final List<OrderItem> orderList = orderProvider.item;
    return Scaffold(
      drawer: DrawerWid(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              print(dataSnapshot.error);
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(builder: (ctx, orderData, child) {
                return ListView.builder(
                  itemCount: orderData.item.length,
                  itemBuilder: (ctx, i) => OrdersItems(orderData.item[i]),
                );
              });
            }
          }
        },
      ),
    );
  }
}
// ListView.builder(
// itemCount: ,
// itemBuilder: (context, i) {
// return OrdersItems(orderList[i]);
