import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trankcalc/drinks.dart';

class TabAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Insgesamt:'),
          Consumer<Drinks>(
            builder: (ctx, drinks, _) {
              return Text(drinks.totalAmountString);
            },
          )
        ],
      ),
      bottom: TabBar(tabs: <Widget>[
        Tab(child: Text('Getränke')),
        Tab(child: Text('Pfand')),
      ]),
    );
  }
}
