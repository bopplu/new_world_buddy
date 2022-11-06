import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';

class ItemDetailScreen extends HookConsumerWidget {
  static const String route = '/item-detail';

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(selectedItemProvider)!;

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
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Ingredients:'),
                      ),
                      ...selectedItem.ingredients.expand((e) => _createItemRows(e, 0))
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(progressSelectedItemIdProvider.state).state = selectedItem.id;
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
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(shoppingListProvider.notifier).completeItem(selectedItem.id);
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _createItemRows(ShoppingItem item, int level) {
  return [ItemRow(item, level), ...item.ingredients.expand((ing) => _createItemRows(ing, level + 1))];
}

class ItemRow extends ConsumerWidget {
  final int level;
  final ShoppingItem item;

  const ItemRow(this.item, this.level, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    final textStyleStrikethrough = textStyle!.copyWith(decoration: TextDecoration.lineThrough);

    final multiplier = level == 1 ? 12.0 : 18.0;
    final pad = level * multiplier;

    return InkWell(
      onTap: () {
        ref.read(progressSelectedItemIdProvider.state).state = item.id;
        Navigator.of(context).pushNamed(AddProgressScreen.route);
      },
      onLongPress: () {
        ref.read(shoppingListProvider.notifier).completeItem(item.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            if (level != 0)
              Padding(
                padding: EdgeInsets.only(left: pad, right: pad),
                child: const Text('L'),
              ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 77,
                      child: Text(
                        '${item.completedAmount} / ${item.amount}',
                      ),
                    ),
                  ),
                  TextSpan(text: item.name),
                ],
                style: item.complete() ? textStyleStrikethrough : textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
