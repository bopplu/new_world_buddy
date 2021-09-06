import 'package:flutter/material.dart';
import 'package:new_world_buddy/catalog/add_screen.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/catalog/catalog_screen.dart';
import 'package:new_world_buddy/catalog/category_screen.dart';
import 'package:new_world_buddy/home/dashboard_screen.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:new_world_buddy/shopping/shopping_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewWorldBuddy());
}

class NewWorldBuddy extends StatelessWidget {
  const NewWorldBuddy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'New World Buddy',
        theme: ThemeData.dark(),
        home: const DashboardScreen(),
        routes: {
          ShoppingListScreen.route: (_) => const ShoppingListScreen(),
          CatalogScreen.route: (_) => const CatalogScreen(),
          CategoryScreen.route: (_) => const CategoryScreen(),
          AddScreen.route: (_) => const AddScreen()
        },
      ),
      providers: [
        ChangeNotifierProvider<ShoppingListModel>(create: (_) => ShoppingListModel()),
        ChangeNotifierProvider<CatalogModel>(create: (_) => CatalogModel()),
      ],
    );
  }
}
