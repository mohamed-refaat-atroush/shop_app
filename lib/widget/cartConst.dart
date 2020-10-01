import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/carts.dart';
import 'package:shop_app/providers/orders.dart';

class CartConst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Carts>(context);
    final List<CartItem> cartList = cartProvider.cartsList;
    final orderProvider = Provider.of<Orders>(context);
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Text(
              'total',
              style: TextStyle(fontSize: 25),
            ),
            title: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                child: SizedBox(
                    width: 40,
                    child: Text('\$${cartProvider.price.toStringAsFixed(2)}')),
              ),
            ),
            trailing: InkWell(
              onTap: () {
                if (cartProvider.price == 0) {
                  return;
                }
                orderProvider.additem(
                    total: cartProvider.price, product: cartList);
                cartProvider.deleteList();
              },
              child: Text(
                'order Now',
                style: TextStyle(fontSize: 20, color: Color(0xffFF5722)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, i) {
                return Dismissible(
                  key: ValueKey(cartList[i]),
                  background: Container(
                    color: Color(0xffFF5722),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direcyion) {
                    cartProvider.deleteItem(cartList[i]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Text('\$${cartList[i].price}'),
                        backgroundColor: Color(0xffFF5722),
                      ),
                      title: Text('${cartList[i].title}'),
                      subtitle: Text('${cartList[i].price}'),
                      trailing: Text('1'),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
