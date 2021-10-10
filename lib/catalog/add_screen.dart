import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/commons/hooks/item_conversion.dart';
import 'package:new_world_buddy/locations/location_provider.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';

final zeroAmountProvider = StateNotifierProvider.autoDispose<Amount, int>((ref) => Amount());
final selectedItemAmountProvider = StateNotifierProvider.autoDispose<Amount, int>((ref) {
  final selectedItem = ref.watch(progressSelectedItemProvider)!;
  return Amount(selectedItem.completedAmount);
});

class Amount extends StateNotifier<int> {
  Amount([int? initial]) : super(initial ?? 0);

  void increment(int amount) {
    state += amount;
  }

  void set(int amount) {
    state = amount;
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
    final item = useProvider(itemProvider(itemName))!;
    final _amount = useProvider(zeroAmountProvider);
    final location = useProvider(selectedLocationProvider);
    final shoppingItemForItem = useConvertItem(item, _amount, location);

    return AddWidget(
      'Add',
      zeroAmountProvider,
      doneAction: () {
        context.read(shoppingListProvider.notifier).addItem(shoppingItemForItem, _amount, location);
        Navigator.popUntil(context, ModalRoute.withName(ShoppingListScreen.route));
        context.read(zeroAmountProvider.notifier).reset();
      },
    );
  }
}

class AddProgressScreen extends HookWidget {
  static const String route = "/add-progress-screen";

  const AddProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _amount = useProvider(selectedItemAmountProvider);
    final selectedItem = useProvider(progressSelectedItemProvider)!;

    return AddWidget(
      'Add Progress to ${selectedItem.name}',
      selectedItemAmountProvider,
      doneAction: () {
        context.read(shoppingListProvider.notifier).updateItem(selectedItem.id, completedAmount: _amount);
        Navigator.of(context).pop();
      },
    );
  }
}

class AddProgressIngredientListScreen extends HookWidget {
  static const String route = "/add-progress-ingredient-list";

  const AddProgressIngredientListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _amount = useProvider(zeroAmountProvider);
    final selectedItem = useProvider(progressIngredientItemProvider);
    final location = useProvider(selectedLocationProvider);

    return AddWidget(
      'Add Progress to ${selectedItem?.name}',
      zeroAmountProvider,
      doneAction: () {
        Navigator.of(context).pop();
        context
            .read(shoppingListProvider.notifier)
            .updateAllUntilDepleted(selectedItem!.name, location, completedAmount: _amount);
      },
    );
  }
}

class AddWidget extends HookWidget {
  final String title;
  final VoidCallback doneAction;
  final AutoDisposeStateNotifierProvider<Amount, int> passedAmountProvider;

  const AddWidget(this.title, this.passedAmountProvider, {required this.doneAction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _amount = useProvider(passedAmountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          TextButton(
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: doneAction,
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
              AdderCard(1, context.read(passedAmountProvider.notifier).increment),
              AdderCard(5, context.read(passedAmountProvider.notifier).increment),
              AdderCard(10, context.read(passedAmountProvider.notifier).increment),
              AdderCard(30, context.read(passedAmountProvider.notifier).increment),
              AdderCard(50, context.read(passedAmountProvider.notifier).increment),
              AdderCard(100, context.read(passedAmountProvider.notifier).increment)
            ],
            shrinkWrap: true,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read(passedAmountProvider.notifier).reset();
                    },
                    child: const Text(
                      'Reset',
                      textScaleFactor: 2,
                    ),
                  ),
                ],
              ),
            ),
          )
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
