import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_world_buddy/catalog/catalog_screen.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:provider/provider.dart';

enum ShoppingListActions { clear }

class ShoppingListScreen extends StatelessWidget {
  static const route = 'shopping-list';

  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingListModel>(
      builder: (ctx, shoppingList, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: PopupMenuButton<ShoppingListActions>(
                onSelected: (choice) {
                  switch (choice) {
                    case ShoppingListActions.clear:
                      final shoppingListModel = context.read<ShoppingListModel>();
                      shoppingListModel.clearList();
                      break;
                  }
                },
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                    child: Text('Clear List'),
                    value: ShoppingListActions.clear,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: shoppingList.items.length,
          itemBuilder: (ctx, index) => ShoppingRow(index),
          separatorBuilder: (_, index) => const Divider(
            thickness: 1,
          ),
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
      ),
    );
  }
}

class ShoppingRow extends StatelessWidget {
  final int index;

  const ShoppingRow(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingListModel = context.read<ShoppingListModel>();
    final item = shoppingListModel.getByPosition(index);

    final textStyle = Theme.of(context).textTheme.bodyText1;
    final textStyleStrikethrough = textStyle!.copyWith(decoration: TextDecoration.lineThrough);

    return InkWell(
      onTap: () {
        shoppingListModel.completeItem(item.name);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: item.amount.toString()),
              const WidgetSpan(
                child: SizedBox(
                  width: 30,
                ),
              ),
              TextSpan(text: item.name)
            ],
            style: item.complete ? textStyleStrikethrough : textStyle,
          ),
        ),
      ),
    );
  }
}
