import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class EditProduct extends StatelessWidget {
  final Product productItem;
  EditProduct(this.productItem);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    // final List<Product> productList = productProvider.items;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              productItem.imageUrl,
            ),
          ),
          title: Text("${productItem.title}"),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          EditProductScreen.routeName,
                          arguments: productItem.id);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xffFF5722),
                    )),
                IconButton(
                    onPressed: () async {
                      try {
                        await Provider.of<Products>(context, listen: false)
                            .deleteProduct(productItem.id);
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Deleting field')));
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
