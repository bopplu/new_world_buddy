import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

import 'item.dart';

class CategoryScreen extends HookWidget {
  static const String route = '/category';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Gcard;
    final categoryItems = useProvider(itemsByCategory);

    return categoryItems.when(
        data: (items) {
          return Scaffold(
            appBar: AppBar(
              title: Text(args.name),
            ),
            body: ListView.separated(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CategoryItem(items[i]),
              separatorBuilder: (ctx, i) => const Divider(),
            ),
          );
        },
        loading: () => const Scaffold(
              body: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 64,
                  width: 64,
                ),
              ),
            ),
        error: (err, stack) => ErrorWidget(err));
  }
}

class CategoryItem extends StatelessWidget {
  final Item item;

  const CategoryItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Navigator.pushNamed(context, AddScreen.route, arguments: item.name);
      },
    );
  }
}
