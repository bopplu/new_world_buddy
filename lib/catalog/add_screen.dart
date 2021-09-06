import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  static const String route = "/add-screen";

  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int _amount = 0;

  void increaseAmount(int amount) {
    setState(() {
      _amount += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemName = ModalRoute.of(context)!.settings.arguments as String;
    final ShoppingListModel shoppingListModel = context.read<ShoppingListModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        actions: [
          TextButton(
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              shoppingListModel.addItem(itemName, _amount);
              Navigator.popUntil(context, ModalRoute.withName(ShoppingListScreen.route));
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_amount',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          GridView.count(
            primary: false,
            childAspectRatio: 4 / 3,
            semanticChildCount: 6,
            crossAxisCount: 2,
            children: [
              AdderCard(1, increaseAmount),
              AdderCard(5, increaseAmount),
              AdderCard(10, increaseAmount),
              AdderCard(30, increaseAmount),
              AdderCard(50, increaseAmount),
              AdderCard(100, increaseAmount)
            ],
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}

class AdderCard extends StatelessWidget {
  final int toAdd;
  final Function increaserFn;

  const AdderCard(this.toAdd, this.increaserFn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Card(
          child: Text(toAdd.toString()),
        ),
        height: 30,
      ),
      onTap: () {
        increaserFn(toAdd);
      },
    );
  }
}
