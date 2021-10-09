import 'dart:convert';

import 'package:collection/src/iterable_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:new_world_buddy/catalog/category_screen.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:new_world_buddy/commons/generic_card.dart';

final futureItemProvider = FutureProvider<List<Item>>((ref) async {
  final response = await http.get(Uri.parse('https://storage.googleapis.com/new-world-buddy/items.json'));

  if (response.statusCode == 200) {
    return ItemList.fromJson(jsonDecode(response.body)).items;
  } else {
    throw Exception('Failed to load item list');
  }
});

final selectedCategory = StateProvider<ItemCategory?>((ref) => null);

final itemsByCategory = Provider<AsyncValue<List<Item>>>((ref) {
  final category = ref.watch(selectedCategory);
  return ref.watch(futureItemProvider).whenData((list) {
    list.sort((a, b) => a.tier == b.tier ? a.name.compareTo(b.name) : a.tier.compareTo(b.tier));
    return list.where((item) => item.category.toLowerCase() == category.state?.name.toLowerCase()).toList();
  });
});

final fullItemListProvider = Provider<List<Item>>((ref) {
  return ref.watch(futureItemProvider).maybeWhen(data: (list) => list, orElse: () => []);
});

final itemProvider = Provider.family<Item?, String>((ref, name) {
  return ref.watch(fullItemListProvider).singleWhereOrNull((element) => element.name == name);
});

class CategoryCard extends Gcard {
  final ItemCategory category;

  @override
  final String url;

  CategoryCard(this.category, this.url) : super(category.name, url);
}

final futureCategoryProvider = FutureProvider<List<ItemCategory>>((ref) async {
  final response = await http.get(Uri.parse('https://storage.googleapis.com/new-world-buddy/categories.json'));

  if (response.statusCode == 200) {
    return ItemCategoryList.fromJson(jsonDecode(response.body)).categories;
  } else {
    throw Exception('Failed to load category list');
  }
});

final catalogWidgetProvider = Provider<AsyncValue<List<CategoryCard>>>((ref) {
  return ref
      .watch(futureCategoryProvider)
      .whenData((list) => list.map((category) => CategoryCard(category, CategoryScreen.route)).toList());
});
