import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';
import 'package:intl/intl.dart';

class OrdersItems extends StatefulWidget {
  final OrderItem order;
  OrdersItems(this.order);
  @override
  _OrdersItemsState createState() => _OrdersItemsState();
}

class _OrdersItemsState extends State<OrdersItems> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Text('\$${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon:
                  _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: (widget.order.product.length * 20.0 + 25),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              margin: EdgeInsets.all(20),
              child: ListView(
                children: widget.order.product
                    .map((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${product.title}',
                                style: TextStyle(fontSize: 20)),
                            Text('\$${product.price}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black45))
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
