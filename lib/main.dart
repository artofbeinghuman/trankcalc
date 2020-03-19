import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './drinks.dart';
import './drinks_list.dart';
import './tab_app_bar.dart';

// TODO: Move total amount into app bar
// TODO: add tabs, one for "Getränke", other for "Pfand"

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Drinks())],
      child: MaterialApp(
        title: 'Trank Calc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Schlürfi Rechner'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: TabAppBar(),
        body: TabBarView(
          children: <Widget>[
            DrinksPfandList(ListType.Drinks),
            DrinksPfandList(ListType.Pfand),
          ],
        ),
      ),
    );
  }
}
