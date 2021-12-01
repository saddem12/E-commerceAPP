import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/orders.dart' as ord;
import 'cart_item.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      shadowColor: Colors.teal.shade50,
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.box,
                        size: 20,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '\$${widget.order.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                ],
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                DateFormat('dd/mm/yyyy (hh:mm)').format(widget.order.dateTime),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  prod.title + ' :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Chip(
                                  label:
                                      Text('${prod.quantity}x\$${prod.price},'),
                                  backgroundColor: Colors.grey.shade100,
                                  elevation: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(),
                        ]),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
