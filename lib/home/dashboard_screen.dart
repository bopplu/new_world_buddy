import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:new_world_buddy/commons/generic_card.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(25),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[GenericCard(Gcard('Town Board', ShoppingListScreen.route))],
        ),
      ),
    );
  }
}
