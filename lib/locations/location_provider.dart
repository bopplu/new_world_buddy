import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:new_world_buddy/shopping/shopping_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final futureLocationListProvider = FutureProvider<LocationList>((ref) async {
  final locationList = json.decode(
    await rootBundle.loadString('assets/location-list.json'),
  ) as Map<String, dynamic>;

  return LocationList.fromJson(locationList);
});

final locationListProvider = Provider<List<String>>((ref) {
  return ref
      .watch(futureLocationListProvider)
      .maybeWhen(data: (locationList) => locationList.locations, orElse: () => ['Failed to load Location List']);
});

final playerLocationsProvider = StateNotifierProvider<PlayerLocations, dynamic>((ref) {
  final prefs = ref.watch(preferencesProvider);
  return PlayerLocations(prefs);
});

final selectedLocationProvider = StateNotifierProvider<LocationSelection, dynamic>((ref) {
  final prefs = ref.watch(preferencesProvider);
  final locationList = ref.watch(locationListProvider);
  return LocationSelection(prefs, locationList[0]);
});

class LocationSelection extends StateNotifier<String> {
  final SharedPreferences? _prefs;
  static const String prefKey = 'selectedLocation';

  final String fallback;

  LocationSelection(this._prefs, this.fallback) : super(_prefs?.getString(prefKey) ?? fallback);

  void selectLocation(String location) {
    state = location;
    _save();
  }

  void _save() {
    _prefs?.setString(prefKey, state);
  }
}

//Not needed for now
class PlayerLocations extends StateNotifier<List<String>> {
  final SharedPreferences? _prefs;

  PlayerLocations(this._prefs) : super(_prefs?.getStringList('locations') ?? []);

  void addLocation(String location) {
    state = [...state, location];
  }

  void removeLocation(String location) {
    state = [...state.where((element) => element != location)];
  }
}
