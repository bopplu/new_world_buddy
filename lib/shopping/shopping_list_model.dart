import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  final flatList = filteredShoppingList.expand((item) => _unwrap(item.ingredients)).toList();

  final occurrenceMap = <String, int>{};
  for (var item in flatList) {
    occurrenceMap.update(item.name, (value) => value += item.amount, ifAbsent: () => item.amount);
  }

  return occurrenceMap.entries.map((e) => ShoppingItem(_uuid.v4(), e.key, e.value, location)).toList();
});

Iterable<ShoppingItem> _unwrap(List<ShoppingItem> list) {
  return list.expand((item) => item.ingredients.isNotEmpty ? _unwrap(item.ingredients) : [item]);
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
    state = _modifyByIdRecursively(
      id,
      state,
      (item) => item.copyWith(
          complete: complete ?? item.complete,
          completedAmount: completedAmount ?? item.completedAmount,
          ingredients: _modifyRecursively(item.ingredients, (item) {
            final amount =
                completedAmount != null ? (completedAmount * item.factor) + item.completedAmount : item.completedAmount;
            return item.copyWith(completedAmount: amount, complete: amount >= item.amount);
          })),
    );
    saveItems();
  }

  void completeItem(String id) {
    state = _modifyByIdRecursively(id, state, (item) => _completeOrToggleRecursively(item));
    saveItems();
  }

  void completeAll(String name, String location) {
    state = _modifyRecursively(state, (item) {
      if (item.name == name) {
        return item.copyWith(completedAmount: item.amount, complete: true);
      }
      return item;
    });
    saveItems();
  }

  void incompleteAll(String name, String location) {
    state = _modifyRecursively(state, (item) {
      if (item.name == name) {
        return item.copyWith(completedAmount: item.amount, complete: false);
      }
      return item;
    });
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

  List<ShoppingItem> _modifyByIdRecursively(
      String id, List<ShoppingItem> searchPile, ShoppingItem Function(ShoppingItem) callback) {
    return searchPile.map((item) {
      if (item.id == id) {
        return callback(item);
      }
      return item.copyWith(ingredients: _modifyByIdRecursively(id, item.ingredients, callback));
    }).toList();
  }

  List<ShoppingItem> _modifyRecursively(List<ShoppingItem> searchPile, ShoppingItem Function(ShoppingItem) callback) {
    return searchPile
        .map((item) => callback(item).copyWith(ingredients: _modifyRecursively(item.ingredients, callback)))
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
