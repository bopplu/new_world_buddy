import 'package:flutter/material.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/commons/generic_card.dart';
import 'package:provider/src/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = '/category';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Gcard;
    final catalogModel = context.read<CatalogModel>();
    final itemsByCategory = catalogModel.getItemsByCategory(args.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: ListView.separated(
        itemCount: itemsByCategory.length,
        itemBuilder: (ctx, i) => CategoryItem(itemsByCategory[i]),
        separatorBuilder: (ctx, i) => const Divider(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Item item;

  const CategoryItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            item.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
