import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

import '../commons/hooks/item_conversion.dart';
import '../locations/location_provider.dart';
import '../shopping/shopping_list_model.dart';
import '../shopping/shopping_list_screen.dart';
import 'item.dart';

class CategoryScreen extends HookConsumerWidget {
  static const String route = '/category';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Gcard;
    final categoryItems = ref.watch(itemsByCategory);

    return categoryItems.when(
        data: (items) {
          return Scaffold(
            appBar: AppBar(
              title: Text(args.name),
            ),
            body: SizedBox(
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (ctx, i) => CategoryItem(items[i], args.name),
                separatorBuilder: (ctx, i) => const Divider(),
              ),
            ),
          );
        },
        loading: () => const Scaffold(
              body: Center(
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        error: (err, stack) => ErrorWidget(err));
  }
}

class CategoryItem extends HookConsumerWidget {
  final Item item;
  final String category;

  const CategoryItem(this.item, this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(selectedLocationProvider);
    final shoppingItemForItem = useConvertItem(ref, item, 1, location);

    return InkWell(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              item.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
      onTap: () {
        if (category == "Crates") {
          ref.read(shoppingListProvider.notifier).addItem(shoppingItemForItem, 1, location);
          Navigator.popUntil(context, ModalRoute.withName(ShoppingListScreen.route));
          ref.read(zeroAmountProvider.notifier).reset();
        } else {
          Navigator.pushNamed(context, AddScreen.route, arguments: item.name);
        }
      },
    );
  }
}
