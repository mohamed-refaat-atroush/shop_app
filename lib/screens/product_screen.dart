import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/carts.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widget/badge.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/widget/product_grid.dart';

enum FilterOptions {
  favorit,
  all,
}

class ProductScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Products>(context).fetchAndSetProducts().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (e) {
        print(e);
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('error'),
                  content: Text('sorry an error occure'),
                  actions: [
                    FlatButton(
                      child: Text('ok'),
                      onPressed: () {
                        setState(() {
                          _isLoading = false;
                        });

                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var prodNum = Provider.of<Carts>(context).numOfProduct;

    return Scaffold(
      drawer: DrawerWid(),
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorit) {
                  // ignore: unnecessary_statements
                  _showOnlyFavorites = true;
                } else {
                  // ignore: unnecessary_statements
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('all'),
                value: FilterOptions.all,
              ),
              PopupMenuItem(
                child: Text('favorit'),
                value: FilterOptions.favorit,
              )
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            icon: Badge(
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.white,
              ),
              value: '$prodNum',
            ),
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavorites),
    );
  }
}
