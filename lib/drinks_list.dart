import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './drinks.dart';

enum ListType { Drinks, Pfand }

class DrinksPfandList extends StatelessWidget {
  final ListType type;

  DrinksPfandList(this.type);

  Widget _buildDrinkListItem({
    @required String name,
    @required int quantity,
    @required Function add,
    @required Function remove,
  }) {
    return ListTile(
      leading: Icon(Icons.local_bar),
      title: Text(name),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('$quantity x'),
          IconButton(icon: Icon(Icons.add), onPressed: add),
          IconButton(icon: Icon(Icons.remove), onPressed: remove),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final drinksProvider = Provider.of<Drinks>(context);
    return ListView.builder(
      itemCount: drinksProvider.drinks.length,
      itemBuilder: (ctx, i) {
        final drink = drinksProvider.drinks[i];
        return type == ListType.Drinks
            ? _buildDrinkListItem(
                name: drink['name'],
                quantity: drink['quantity'],
                add: () => drinksProvider.addDrink(i),
                remove: () => drinksProvider.removeDrink(i),
              )
            : _buildDrinkListItem(
                name: 'Kasten ${drink["name"]}',
                quantity: drink['pfand_quantity'],
                add: () => drinksProvider.addDrink(i, isPfand: true),
                remove: () => drinksProvider.removeDrink(i, isPfand: true),
              );
      },
    );
  }
}
