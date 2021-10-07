import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class ItemList with _$ItemList {
  const factory ItemList(List<Item> items) = _ItemList;

  factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item(String name, String category, int tier, List<Ingredient>? ingredients) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class ItemCategory with _$ItemCategory {
  const factory ItemCategory(String name, int order) = _ItemCategory;

  factory ItemCategory.fromJson(Map<String, dynamic> json) => _$ItemCategoryFromJson(json);
}

@freezed
class ItemCategoryList with _$ItemCategoryList {
  const factory ItemCategoryList(List<ItemCategory> categories) = _ItemCategoryList;

  factory ItemCategoryList.fromJson(Map<String, dynamic> json) => _$ItemCategoryListFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient(String name, int quantity) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}

@freezed
class ShoppingItem with _$ShoppingItem {
  const factory ShoppingItem(String id, String name, int amount, String location, bool complete) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);
}

@freezed
class LocationList with _$LocationList {
  const factory LocationList(List<String> locations) = _LocationList;

  factory LocationList.fromJson(Map<String, dynamic> json) => _$LocationListFromJson(json);
}
