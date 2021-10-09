// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemList _$$_ItemListFromJson(Map<String, dynamic> json) => _$_ItemList(
      (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemListToJson(_$_ItemList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      json['name'] as String,
      json['category'] as String,
      json['tier'] as int,
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['hidden'] as bool?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'tier': instance.tier,
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
      'hidden': instance.hidden,
    };

_$_ItemCategory _$$_ItemCategoryFromJson(Map<String, dynamic> json) =>
    _$_ItemCategory(
      json['name'] as String,
      json['order'] as int,
    );

Map<String, dynamic> _$$_ItemCategoryToJson(_$_ItemCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
    };

_$_ItemCategoryList _$$_ItemCategoryListFromJson(Map<String, dynamic> json) =>
    _$_ItemCategoryList(
      (json['categories'] as List<dynamic>)
          .map((e) => ItemCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemCategoryListToJson(_$_ItemCategoryList instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      json['name'] as String,
      json['quantity'] as int,
      completedAmount: json['completedAmount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'completedAmount': instance.completedAmount,
    };

_$_ShoppingItem _$$_ShoppingItemFromJson(Map<String, dynamic> json) =>
    _$_ShoppingItem(
      json['id'] as String,
      json['name'] as String,
      json['amount'] as int,
      json['location'] as String,
      completedAmount: json['completedAmount'] as int? ?? 0,
      complete: json['complete'] as bool? ?? false,
      factor: json['factor'] as int? ?? 1,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => ShoppingItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ShoppingItemToJson(_$_ShoppingItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'location': instance.location,
      'completedAmount': instance.completedAmount,
      'complete': instance.complete,
      'factor': instance.factor,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };

_$_LocationList _$$_LocationListFromJson(Map<String, dynamic> json) =>
    _$_LocationList(
      (json['locations'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LocationListToJson(_$_LocationList instance) =>
    <String, dynamic>{
      'locations': instance.locations,
    };
