import 'dart:convert';
import 'dart:developer';

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

class ShoppingList extends StateNotifier<List<ShoppingItem>> {
  final SharedPreferences? _prefs;
  static const String prefKey = 'shoppingList';

  ShoppingList(this._prefs)
      : super(_prefs?.getStringList(prefKey)?.map((e) {
              return ShoppingItem.fromJson(json.decode(e));
            }).toList() ??
            []);

  void addItem(String name, int amount, String location) {
    state = [...state, ShoppingItem(_uuid.v4(), name, amount, location, false)];
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
