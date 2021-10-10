import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';

class ItemDetailScreen extends HookWidget {
  static const String route = '/item-detail';

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedItem = useProvider(selectedItemProvider)!;

    final textStyle = Theme.of(context).textTheme.bodyText1;
    final textStyleStrikethrough = textStyle!.copyWith(decoration: TextDecoration.lineThrough);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem.name),
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
                  '${selectedItem.completedAmount} / ${selectedItem.amount}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Ingredients:'),
                ),
                ...selectedItem.ingredients.map(
                  (e) => InkWell(
                    onTap: () {
                      context.read(progressSelectedItemIdProvider).state = e.id;
                      Navigator.of(context).pushNamed(AddProgressScreen.route);
                    },
                    onLongPress: () {
                      context.read(shoppingListProvider.notifier).completeItem(e.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: SizedBox(
                                    width: 77,
                                    child: Text(
                                      '${e.completedAmount} / ${e.amount}',
                                    ),
                                  ),
                                ),
                                TextSpan(text: e.name),
                              ],
                              style: e.complete() ? textStyleStrikethrough : textStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read(shoppingListProvider.notifier).completeItem(selectedItem.id);
                    if (!selectedItem.complete()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Complete',
                    textScaleFactor: 1.5,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size.fromHeight(50),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read(progressSelectedItemIdProvider).state = selectedItem.id;
                    Navigator.of(context).pushNamed(AddProgressScreen.route);
                  },
                  child: const Text(
                    'Add Progress',
                    textScaleFactor: 1.1,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondaryVariant,
                    fixedSize: const Size.fromHeight(50),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
