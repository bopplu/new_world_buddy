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

final selectedItemIdProvider = StateProvider<String>((ref) => '');
final selectedItemProvider = Provider<ShoppingItem?>((ref) {
  final shoppingList = ref.watch(shoppingListProvider);
  final selectedItemId = ref.watch(selectedItemIdProvider);
  return ref.watch(shoppingListProvider.notifier).findByIdRecursively(selectedItemId.state, shoppingList);
});

final progressSelectedItemIdProvider = StateProvider<String>((ref) => '');
final progressSelectedItemProvider = Provider<ShoppingItem?>((ref) {
  final shoppingList = ref.watch(shoppingListProvider);
  final selectedItemId = ref.watch(progressSelectedItemIdProvider);
  return ref.watch(shoppingListProvider.notifier).findByIdRecursively(selectedItemId.state, shoppingList);
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
  final ingredientShoppingList =
      shoppingListMap.entries.map((entry) => ShoppingItem(_uuid.v4(), entry.key, entry.value, location)).toList();
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

final ingredientListProvider = StateNotifierProvider<IngredientList, List<ShoppingItem>>((ref) {
  final list = ref.watch(ingredientShoppingListProvider);
  return IngredientList(list);
});

class IngredientList extends StateNotifier<List<ShoppingItem>> {
  IngredientList(List<ShoppingItem>? initialList) : super(initialList ?? []);

  void completeItem(String id) {
    state = [
      ...state.where((item) => item.id != id),
      ...state.where((item) => item.id == id).map((item) => item.copyWith(complete: true)),
    ];
  }

  void replace(List<ShoppingItem> list) {
    log('state $state, list $list');
    state = list;
  }
}

class ShoppingList extends StateNotifier<List<ShoppingItem>> {
  final SharedPreferences? _prefs;
  static const String prefKey = 'shoppingList';

  ShoppingList(this._prefs)
      : super(_prefs?.getStringList(prefKey)?.map((e) {
              return ShoppingItem.fromJson(json.decode(e));
            }).toList() ??
            []);

  void addItem(ShoppingItem item, int amount, String location) {
    final ShoppingItem? existingItem =
        state.singleWhereOrNull((shoppingItem) => shoppingItem.name == item.name && shoppingItem.location == location);
    final others = state.where((element) => element.id != existingItem?.id);

    final existingAmount = existingItem?.amount ?? 0;
    final existingIngredients = existingItem?.ingredients ?? [];

    final itemToAdd = existingItem?.copyWith(
            amount: existingAmount + item.amount,
            ingredients: _updateIngredients(existingIngredients, item.ingredients),
            complete: false) ??
        item;

    state = [...others, itemToAdd];
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

  void updateItem(String id, {int? completedAmount, bool? complete}) {
    state = modifyByIdRecursively(
      id,
      state,
      (item) => item.copyWith(
          complete: complete ?? item.complete,
          completedAmount: completedAmount ?? item.completedAmount,
          ingredients: modifyRecursively(item.ingredients, (item) {
            final amount =
                completedAmount != null ? (completedAmount * item.factor) + item.completedAmount : item.completedAmount;
            return item.copyWith(completedAmount: amount, complete: amount >= item.amount);
          })),
    );
    saveItems();
  }

  void completeItem(String id) {
    state = modifyByIdRecursively(id, state, (item) => _completeOrToggleRecursively(item));
    saveItems();
  }

  List<ShoppingItem> _updateIngredients(List<ShoppingItem> ingredients, List<ShoppingItem> others) {
    return ingredients.map((e) {
      final match = others.singleWhereOrNull((other) => other.name == e.name);
      return e.copyWith(
          amount: e.amount + (match?.amount ?? 0),
          complete: false,
          ingredients: _updateIngredients(e.ingredients, match?.ingredients ?? []));
    }).toList();
  }

  List<ShoppingItem> _flatten(ShoppingItem item) {
    return [item, ...item.ingredients.expand((ingredient) => _flatten(ingredient))];
  }

  ShoppingItem? findByIdRecursively(String id, List<ShoppingItem> searchPile) {
    return searchPile.expand((item) => _flatten(item)).singleWhereOrNull((item) => item.id == id);
  }

  List<ShoppingItem> modifyByIdRecursively(
      String id, List<ShoppingItem> searchPile, ShoppingItem Function(ShoppingItem) callback) {
    return searchPile.map((item) {
      if (item.id == id) {
        return callback(item);
      }
      return item.copyWith(ingredients: modifyByIdRecursively(id, item.ingredients, callback));
    }).toList();
  }

  List<ShoppingItem> modifyRecursively(List<ShoppingItem> searchPile, ShoppingItem Function(ShoppingItem) callback) {
    return searchPile
        .map((item) => callback(item).copyWith(ingredients: modifyRecursively(item.ingredients, callback)))
        .toList();
  }

  ShoppingItem _completeOrToggleRecursively(ShoppingItem item, {bool? complete}) {
    final isToggle = complete == null;
    final value = isToggle ? !item.complete : complete!;
    return item.copyWith(
        complete: value,
        completedAmount: value ? item.amount : 0,
        ingredients:
            item.ingredients.map((ingredient) => _completeOrToggleRecursively(ingredient, complete: value)).toList());
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
