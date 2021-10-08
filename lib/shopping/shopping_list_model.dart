import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:new_world_buddy/locations/location_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final shoppingListProvider = StateNotifierProvider<ShoppingList, List<ShoppingItem>>((ref) {
  final SharedPreferences? prefs =
      ref.watch(futurePreferencesProvider).maybeWhen(data: (data) => data, orElse: () => null);
  return ShoppingList(prefs);
});

final filteredShoppingListProvider = Provider<List<ShoppingItem>>((ref) {
  final shoppingList = ref.watch(shoppingListProvider);
  final location = ref.watch(selectedLocationProvider);
  return shoppingList.where((item) => item.location == location).toList();
});

final ingredientShoppingListProvider = Provider<List<ShoppingItem>>((ref) {
  final location = ref.watch(selectedLocationProvider);
  final filteredShoppingList = ref.watch(filteredShoppingListProvider);
  final itemList = ref.watch(fullItemListProvider);
  final itemNames = itemList.map((item) => item.name);

  final items = filteredShoppingList
      .where((shoppingItem) => !shoppingItem.complete)
      .where((shoppingItem) => itemNames.contains(shoppingItem.name))
      .map((shoppingItem) => itemList.singleWhere((item) => shoppingItem.name == item.name));
  final itemsWithIngredients = items.where((item) => item.ingredients != null && item.ingredients!.isNotEmpty);
  final itemsWithIngredientsNames = itemsWithIngredients.map((item) => item.name);
  final itemsWithoutIngredientsNames =
      items.where((item) => item.ingredients == null || item.ingredients!.isEmpty).map((item) => item.name);
  final shoppingItemsWithoutIngredients =
      filteredShoppingList.where((shoppingItem) => itemsWithoutIngredientsNames.contains(shoppingItem.name));
  final shoppingItemsWithIngredients =
      filteredShoppingList.where((shoppingItem) => itemsWithIngredientsNames.contains(shoppingItem.name));

  final Map<String, int> occurrenceMap = {};
  itemsWithIngredients.expand((item) {
    final shoppingItem = shoppingItemsWithIngredients.singleWhere((shoppingItem) => shoppingItem.name == item.name);
    return [for (var i = 0; i < shoppingItem.amount; i++) ..._unwrapIngredients(itemList, item)];
  }).forEach((ingr) => occurrenceMap.update(ingr.name, (value) => value += 1, ifAbsent: () => 1));

  final shoppingListMap = {for (var item in shoppingItemsWithoutIngredients) item.name: item.amount};

  for (var entry in occurrenceMap.entries) {
    shoppingListMap.update(entry.key, (value) => value += entry.value, ifAbsent: () => entry.value);
  }
  final ingredientShoppingList = shoppingListMap.entries
      .map((entry) => ShoppingItem(_uuid.v4(), entry.key, entry.value, location, false))
      .toList();
  ingredientShoppingList.sort((item, other) => item.name.compareTo(other.name));
  return ingredientShoppingList;
});

Iterable<Item> _unwrapIngredients(Iterable<Item> items, Item itemToUnwrap) {
  return itemToUnwrap.ingredients?.expand((ingredient) {
        final item = items.singleWhere((element) => element.name == ingredient.name);
        final itemsIngredients = [for (var i = 0; i < ingredient.quantity; i++) ..._unwrapIngredients(items, item)];
        return itemsIngredients.isNotEmpty ? itemsIngredients : [for (var i = 0; i < ingredient.quantity; i++) item];
      }) ??
      [];
}

class ShoppingList extends StateNotifier<List<ShoppingItem>> {
  final SharedPreferences? _prefs;
  static const String prefKey = 'shoppingList';

  ShoppingList(this._prefs)
      : super(_prefs?.getStringList(prefKey)?.map((e) {
              return ShoppingItem.fromJson(json.decode(e));
            }).toList() ??
            []);

  void addItem(String name, int amount, String location) {
    final ShoppingItem? existingItem =
        state.singleWhereOrNull((item) => item.name == name && item.location == location);
    final others = state.where((element) => element.id != existingItem?.id);

    final existingAmount = existingItem?.amount ?? 0;

    final item = existingItem?.copyWith(amount: existingAmount + amount) ??
        ShoppingItem(_uuid.v4(), name, amount, location, false);

    state = [...others, item];
    saveItems();
  }

  void clearList(String location) {
    state = [...state.where((item) => item.location != location)];
    saveItems();
  }

  void clearDone(String location) {
    state = [...state.where((item) => !item.complete || item.location != location)];
    saveItems();
  }

  void completeItem(String id) {
    state = [
      ...state.where((element) => element.id != id),
      ...state.where((element) => element.id == id).map((e) => e.copyWith(complete: !e.complete))
    ];
    saveItems();
  }

  void saveItems() {
    _prefs?.setStringList(
        prefKey,
        state.map((e) {
          return json.encode(e);
        }).toList());
  }
}

final futurePreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async => await SharedPreferences.getInstance());

final preferencesProvider = Provider((ref) {
  return ref.watch(futurePreferencesProvider).maybeWhen(
      data: (data) => data,
      error: (err, stack) {
        log('encountered error while fetching provider $err');
      },
      orElse: () => null);
});
