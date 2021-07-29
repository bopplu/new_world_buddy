import 'package:flutter/material.dart';
import 'package:new_world_buddy/commons/generic_card.dart';
import 'package:provider/src/provider.dart';

import 'catalog_model.dart';

class CatalogScreen extends StatelessWidget {
  static const String route = '/catalog';

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalogModel = context.read<CatalogModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: GridView.builder(
        itemCount: catalogModel.categories.length,
        itemBuilder: (ctx, index) => GenericCard(catalogModel.getCategoryByPosition(index)),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
