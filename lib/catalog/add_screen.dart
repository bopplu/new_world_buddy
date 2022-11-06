import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class AddScreen extends HookConsumerWidget {
  static const String route = "/add-screen";

  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemName = ModalRoute.of(context)!.settings.arguments as String;
    final item = ref.watch(itemProvider(itemName))!;
    final amount = ref.watch(zeroAmountProvider);
    final location = ref.watch(selectedLocationProvider);
    final shoppingItemForItem = useConvertItem(ref, item, amount, location);

    return AddWidget(
      'Add',
      zeroAmountProvider,
      doneAction: () {
        ref.read(shoppingListProvider.notifier).addItem(shoppingItemForItem, amount, location);
        Navigator.popUntil(context, ModalRoute.withName(ShoppingListScreen.route));
        ref.read(zeroAmountProvider.notifier).reset();
      },
    );
  }
}

class AddProgressScreen extends HookConsumerWidget {
  static const String route = "/add-progress-screen";

  const AddProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _amount = ref.watch(selectedItemAmountProvider);
    final selectedItem = ref.watch(progressSelectedItemProvider)!;

    return AddWidget(
      'Add Progress to ${selectedItem.name}',
      selectedItemAmountProvider,
      doneAction: () {
        ref.read(shoppingListProvider.notifier).updateItem(selectedItem.id, completedAmount: _amount);
        Navigator.of(context).pop();
      },
    );
  }
}

class AddProgressIngredientListScreen extends HookConsumerWidget {
  static const String route = "/add-progress-ingredient-list";

  const AddProgressIngredientListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(zeroAmountProvider);
    final selectedItem = ref.watch(progressIngredientItemProvider);
    final location = ref.watch(selectedLocationProvider);

    return AddWidget(
      'Add Progress to ${selectedItem?.name}',
      zeroAmountProvider,
      doneAction: () {
        Navigator.of(context).pop();
        ref
            .read(shoppingListProvider.notifier)
            .updateAllUntilDepleted(selectedItem!.name, location, completedAmount: amount);
      },
    );
  }
}

class AddWidget extends HookConsumerWidget {
  final String title;
  final VoidCallback doneAction;
  final AutoDisposeStateNotifierProvider<Amount, int> passedAmountProvider;

  const AddWidget(this.title, this.passedAmountProvider, {required this.doneAction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(passedAmountProvider);
    const double resetHeight = 50;
    const double counterHeight = 100;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    final gridExtend = screenHeight - (resetHeight + counterHeight + 500);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: doneAction,
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: counterHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$amount',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (ctx, constraints) => GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
                    mainAxisExtent: constraints.maxHeight * (1 / (orientation == Orientation.landscape ? 2 : 3))),
                primary: false,
                semanticChildCount: 6,
                shrinkWrap: true,
                children: [
                  AdderCard(1, ref.read(passedAmountProvider.notifier).increment),
                  AdderCard(5, ref.read(passedAmountProvider.notifier).increment),
                  AdderCard(10, ref.read(passedAmountProvider.notifier).increment),
                  AdderCard(30, ref.read(passedAmountProvider.notifier).increment),
                  AdderCard(50, ref.read(passedAmountProvider.notifier).increment),
                  AdderCard(100, ref.read(passedAmountProvider.notifier).increment)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: resetHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      ref.read(passedAmountProvider.notifier).reset();
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
        height: 30,
        child: Card(
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                toAdd.toString(),
                style: const TextStyle(fontSize: 48),
              )),
        ),
      ),
      onTap: () {
        increaserFn(toAdd);
      },
    );
  }
}
