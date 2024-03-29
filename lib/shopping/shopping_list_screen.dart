
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/catalog/catalog_screen.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:new_world_buddy/locations/location_provider.dart';
import 'package:new_world_buddy/shopping/item_detail_screen.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';

enum ShoppingListActions { refresh, clear, clearDone }

class ShoppingListScreen extends HookConsumerWidget {
  static const route = 'shopping-list';

  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredShoppingList = ref.watch(filteredShoppingListProvider);
    final ingredientShoppingList = ref.watch(ingredientListProvider);
    final locationList = ref.watch(locationListProvider);
    final selectedLocation = ref.watch(selectedLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            DropdownButton(
              value: selectedLocation,
              items: locationList
                  .map(
                    (loc) => DropdownMenuItem(
                  child: Text(loc),
                  value: loc,
                ),
              )
                  .toList(),
              onChanged: (newVal) {
                ref.read(selectedLocationProvider.notifier).selectLocation(newVal ?? selectedLocation);
              },
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton<ShoppingListActions>(
              onSelected: (choice) {
                switch (choice) {
                  case ShoppingListActions.clear:
                    ref.read(shoppingListProvider.notifier).clearList(selectedLocation);
                    break;
                  case ShoppingListActions.clearDone:
                    ref.read(shoppingListProvider.notifier).clearDone(selectedLocation);
                    break;
                  case ShoppingListActions.refresh:
                    ref.refresh(futureItemProvider);
                    ref.refresh(futureCategoryProvider.future);
                    break;
                }
              },
              itemBuilder: (ctx) =>
              [
                const PopupMenuItem(
                  child: Text('Clear Done'),
                  value: ShoppingListActions.clearDone,
                ),
                const PopupMenuItem(
                  child: Text('Refresh'),
                  value: ShoppingListActions.refresh,
                ),
                const PopupMenuItem(
                  child: Text('Clear List'),
                  value: ShoppingListActions.clear,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Flexible(
            child: ListView.separated(
              itemCount: filteredShoppingList.length,
              itemBuilder: (ctx, index) => ShoppingRow(
                index,
                filteredShoppingList,
                onTap: () {
                  ref.read(selectedItemIdProvider.notifier).state = filteredShoppingList[index].id;
                  Navigator.pushNamed(ctx, ItemDetailScreen.route);
                },
                onLongPress: () {
                  ref.read(shoppingListProvider.notifier).completeItem(filteredShoppingList[index].id);
                },
              ),
              separatorBuilder: (_, index) => const Divider(
                thickness: 1,
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
          ),
          Flexible(
            child: ListView.separated(
              itemCount: ingredientShoppingList.length,
              itemBuilder: (ctx, index) => ShoppingRow(
                index,
                ingredientShoppingList,
                onTap: () {
                  ref.read(progressIngredientItemIdProvider.notifier).state = ingredientShoppingList[index].id;
                  Navigator.of(context).pushNamed(AddProgressIngredientListScreen.route);
                },
                onLongPress: () {
                  final item = ingredientShoppingList[index];
                  ref.read(shoppingListProvider.notifier).completeAll(item.name, item.location);
                },
              ),
              separatorBuilder: (_, index) => const Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CatalogScreen.route);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }
}

class ShoppingRow extends HookWidget {
  final int index;
  final List<ShoppingItem> source;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ShoppingRow(this.index, this.source, {this.onTap, this.onLongPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = source[index];

    final textStyle = Theme.of(context).textTheme.bodyText1;
    final textStyleStrikethrough = textStyle!.copyWith(decoration: TextDecoration.lineThrough);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(
                  width: 37,
                  child: Text(item.amount.toString()),
                ),
              ),
              const WidgetSpan(
                child: SizedBox(
                  width: 10,
                ),
              ),
              TextSpan(
                text: item.name,
              ),
            ],
            style: item.complete() ? textStyleStrikethrough : textStyle,
          ),
        ),
      ),
    );
  }
}
