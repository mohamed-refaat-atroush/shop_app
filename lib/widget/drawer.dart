import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';

class DrawerWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 20),
            color: Colors.red,
            child: Row(
              children: [
                SizedBox(width: 20),
                Text('Hello Friends',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.white))
              ],
            ),
          ),
          SizedBox(
            height: 10,
            child: Divider(),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, ProductScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Row(
                children: [
                  Icon(Icons.shop, size: 25),
                  SizedBox(width: 10),
                  Text('MyShop'),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OrderScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Row(
                children: [
                  Icon(Icons.credit_card, size: 25),
                  SizedBox(width: 10),
                  Text('Orders'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Divider(),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, UserProductScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Row(
                children: [
                  Icon(Icons.edit, size: 25),
                  SizedBox(width: 10),
                  Text('Manage Products'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
