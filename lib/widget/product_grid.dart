import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widget/product_gridTitle.dart';

class ProductGrid extends StatelessWidget {
  final bool fav;
  ProductGrid(this.fav);
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final List<Product> productList =
        fav ? productsProvider.favItems : productsProvider.items;
    print(productsProvider.favItems);
    print(fav);
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value: productList[i],
            child: ProductGridTitle(),
          );
        });
  }
}
