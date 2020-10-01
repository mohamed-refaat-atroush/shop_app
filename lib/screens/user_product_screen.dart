import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/widget/edit_product.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const String routeName = '/editProduct';
  Future<void> _refresh(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    final List<Product> productList = productProvider.items;
    return Scaffold(
      drawer: DrawerWid(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, i) {
              return EditProduct(productList[i]);
            }),
      ),
    );
  }
}
