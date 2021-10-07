import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

import 'catalog_model.dart';

class CatalogScreen extends HookWidget {
  static const String route = '/catalog';

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalogWidgets = useProvider(catalogWidgetProvider);
    final selectedCateg = useProvider(selectedCategory);

    return catalogWidgets.when(
        data: (catalogList) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Catalog'),
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(3),
              itemCount: catalogList.length,
              itemBuilder: (ctx, index) => GenericCard(
                catalogList[index],
                onClick: () {
                  selectedCateg.state = catalogList[index].category;
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
        error: (err, stack) {
          return ErrorWidget(err);
        });
  }
}
