import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/user_products_screen.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        alignment: Alignment.topLeft,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text(
                'E-commerce',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              tileColor: Colors.white,
              hoverColor: Theme.of(context).accentColor,
              leading: FaIcon(
                FontAwesomeIcons.tags,
                color: Colors.white,
              ),
              title: Text(
                'Shop',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/',
                );
              },
            ),
            ListTile(
              tileColor: Colors.white,
              hoverColor: Theme.of(context).accentColor,
              leading: FaIcon(
                FontAwesomeIcons.boxes,
                color: Colors.white,
              ),
              title: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  OrdersScreen.routeName,
                );
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              tileColor: Colors.white,
              hoverColor: Theme.of(context).accentColor,
              leading: FaIcon(
                FontAwesomeIcons.pen,
                color: Colors.white,
              ),
              title: Text(
                'Manage products',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  UserProductsScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
