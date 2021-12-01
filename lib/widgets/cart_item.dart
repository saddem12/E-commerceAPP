import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItem(
    this.id,
    this.productId,
    this.title,
    this.imageUrl,
    this.price,
    this.quantity,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Cofirm deleting'),
            content: Text('Do you want to remove item?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      key: ValueKey(id),
      background: Container(
        color: Colors.red.shade400,
        child: Icon(
          Icons.delete_forever,
          color: Colors.red.shade50,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 30,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
              radius: 50,
            ),
            title: Row(
              children: <Widget>[
                Chip(
                  label: Text('\$$price'),
                ),
                SizedBox(width: 12),
                Text(title),
              ],
            ),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
