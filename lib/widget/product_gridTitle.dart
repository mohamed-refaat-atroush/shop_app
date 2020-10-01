import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/carts.dart';
import 'package:shop_app/providers/products.dart';

class ProductGridTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context);
    final favFun = Provider.of<Product>(context).favToggle;
    bool showFav = Provider.of<Product>(context).isFavorite;
    final cartProvider = Provider.of<Carts>(context);
    return Container(
      margin: EdgeInsets.all(3),
      // padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: GridTile(
          child: InkWell(
            onTap: () {},
            child: Image.network(
              _product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            leading: InkWell(
              onTap: () {
                favFun();
                Provider.of<Products>(context, listen: false)
                    .productLove(_product.id, _product.isFavorite);
              },
              child: showFav
                  ? Icon(
                      Icons.favorite,
                      color: Color(0xffFF5722),
                    )
                  : Icon(Icons.favorite_border, color: Color(0xffFF5722)),
            ),
            title: Text(_product.title),
            trailing: IconButton(
                onPressed: () {
                  cartProvider.addItem(
                      _product.id, _product.title, _product.price);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color(0xffFF5722),
                )),
          ),
        ),
      ),
    );
  }
}
