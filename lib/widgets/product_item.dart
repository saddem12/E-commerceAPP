import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String price;
  // final String imageUrl;

  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.price,
  //   this.imageUrl,
  // );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        header: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.purple,
          
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              (product.isFavorite ? Icons.favorite : Icons.favorite_outline),
            ),
            color: (product.isFavorite
                ? Colors.red
                : Theme.of(context).accentColor),
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.price.toString() + ' \$',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(
                product.id,
                product.price,
                product.title,
                product.imageUrl,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added item to cart!'),
                  duration: Duration(
                    seconds: 2,
                  ),
                  action: SnackBarAction(
                    label: 'Cancel',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  )));
            },
          ),
        ),
      ),
    );
  }
}
