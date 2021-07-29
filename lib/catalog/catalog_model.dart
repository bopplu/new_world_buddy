import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_world_buddy/catalog/category_screen.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

class Category implements Gcard {
  @override
  String name;
  @override
  String url;

  Category(this.name, this.url);
}

@immutable
class Item {
  final String name;
  final String category;
  final int tier;

  const Item(this.name, this.category, this.tier);

  @override
  String toString() {
    return 'Item{name: $name, category: $category, tier: $tier}';
  }
}

class CatalogModel extends ChangeNotifier {
  final List<Category> _categories = [
    Category('Wood', CategoryScreen.route),
    Category('Ore', CategoryScreen.route),
    Category('Potions', CategoryScreen.route),
    Category('Hides', CategoryScreen.route),
    Category('Meats', CategoryScreen.route)
  ];
  final List<Item> _items = [
    Item('Green Wood', 'Wood', 1),
    Item('Mature Wood', 'Wood', 2),
    Item('Iron Ore', 'Ore', 1),
    Item('Gold Ore', 'Ore', 2),
    Item('Star Metal Ore', 'Ore', 3)
  ];

  List<Category> get categories => [..._categories];

  Category getCategoryByPosition(int index) {
    final category = _categories[index];
    return Category(category.name, category.url);
  }

  List<Item> getItemsByCategory(String category) {
    return [..._items.where((element) => element.category == category)];
  }

  List<Item> get items => [..._items];
}
