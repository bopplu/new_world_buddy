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
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow,
        ),
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
