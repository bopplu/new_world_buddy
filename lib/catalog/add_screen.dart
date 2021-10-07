
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/locations/location_provider.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';

final amountProvider = StateNotifierProvider((ref) => Amount());

class Amount extends StateNotifier<int> {
  Amount() : super(0);

  void increment(int amount) {
    state += amount;
  }

  void reset() {
    state = 0;
  }
}

class AddScreen extends HookWidget {
  static const String route = "/add-screen";

  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemName = ModalRoute.of(context)!.settings.arguments as String;
    final _amount = useProvider(amountProvider);
    final location = useProvider(selectedLocationProvider);

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
              context.read(shoppingListProvider.notifier).addItem(itemName, _amount, location);
              Navigator.popUntil(context, ModalRoute.withName(ShoppingListScreen.route));
              context.read(amountProvider.notifier).reset();
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
              AdderCard(1, context.read(amountProvider.notifier).increment),
              AdderCard(5, context.read(amountProvider.notifier).increment),
              AdderCard(10, context.read(amountProvider.notifier).increment),
              AdderCard(30, context.read(amountProvider.notifier).increment),
              AdderCard(50, context.read(amountProvider.notifier).increment),
              AdderCard(100, context.read(amountProvider.notifier).increment)
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
      child: SizedBox(
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
