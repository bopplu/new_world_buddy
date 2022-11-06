import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

import 'catalog_model.dart';

class CatalogScreen extends HookConsumerWidget {
  static const String route = '/catalog';

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogWidgets = ref.watch(catalogWidgetProvider);
    final selectedCateg = ref.watch(selectedCategory.notifier);
    final orientation = MediaQuery.of(context).orientation;
    final axisCount = orientation == Orientation.landscape ? 3 : 2;

    return catalogWidgets.when(
        data: (catalogList) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Catalog'),
            ),
            body: LayoutBuilder(
              builder: (ctx, constraints) => GridView.builder(
                padding: const EdgeInsets.all(3),
                itemCount: catalogList.length,
                itemBuilder: (ctx, index) => GenericCard(
                  catalogList[index],
                  onClick: () {
                    selectedCateg.state = catalogList[index].category;
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: axisCount, mainAxisExtent: (constraints.maxHeight + 250) * (1 / axisCount)),
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
        error: (err, stack) {
          return ErrorWidget(err);
        });
  }
}
