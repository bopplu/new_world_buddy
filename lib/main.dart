import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/shopping/item_detail_screen.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';

import 'catalog/add_screen.dart';
import 'catalog/catalog_screen.dart';
import 'catalog/category_screen.dart';
import 'home/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: NewWorldBuddy(),
    ),
  );
}

class NewWorldBuddy extends HookWidget {
  const NewWorldBuddy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final preferences = useProvider(preferencesProvider);
    // preferences?.clear();

    return MaterialApp(
      title: 'New World Buddy',
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
      routes: {
        ShoppingListScreen.route: (_) => const ShoppingListScreen(),
        CatalogScreen.route: (_) => const CatalogScreen(),
        CategoryScreen.route: (_) => const CategoryScreen(),
        AddScreen.route: (_) => const AddScreen(),
        ItemDetailScreen.route: (_) => const ItemDetailScreen(),
        AddProgressScreen.route: (_) => const AddProgressScreen(),
        AddProgressIngredientListScreen.route: (_) => const AddProgressIngredientListScreen()
      },
    );
  }
}
