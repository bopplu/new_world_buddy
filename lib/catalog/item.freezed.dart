// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return _ItemList.fromJson(json);
}

/// @nodoc
class _$ItemListTearOff {
  const _$ItemListTearOff();

  _ItemList call(List<Item> items) {
    return _ItemList(
      items,
    );
  }

  ItemList fromJson(Map<String, Object> json) {
    return ItemList.fromJson(json);
  }
}

/// @nodoc
const $ItemList = _$ItemListTearOff();

/// @nodoc
mixin _$ItemList {
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemListCopyWith<ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListCopyWith<$Res> {
  factory $ItemListCopyWith(ItemList value, $Res Function(ItemList) then) =
      _$ItemListCopyWithImpl<$Res>;
  $Res call({List<Item> items});
}

/// @nodoc
class _$ItemListCopyWithImpl<$Res> implements $ItemListCopyWith<$Res> {
  _$ItemListCopyWithImpl(this._value, this._then);

  final ItemList _value;
  // ignore: unused_field
  final $Res Function(ItemList) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
abstract class _$ItemListCopyWith<$Res> implements $ItemListCopyWith<$Res> {
  factory _$ItemListCopyWith(_ItemList value, $Res Function(_ItemList) then) =
      __$ItemListCopyWithImpl<$Res>;
  @override
  $Res call({List<Item> items});
}

/// @nodoc
class __$ItemListCopyWithImpl<$Res> extends _$ItemListCopyWithImpl<$Res>
    implements _$ItemListCopyWith<$Res> {
  __$ItemListCopyWithImpl(_ItemList _value, $Res Function(_ItemList) _then)
      : super(_value, (v) => _then(v as _ItemList));

  @override
  _ItemList get _value => super._value as _ItemList;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_ItemList(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemList implements _ItemList {
  const _$_ItemList(this.items);

  factory _$_ItemList.fromJson(Map<String, dynamic> json) =>
      _$$_ItemListFromJson(json);

  @override
  final List<Item> items;

  @override
  String toString() {
    return 'ItemList(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$ItemListCopyWith<_ItemList> get copyWith =>
      __$ItemListCopyWithImpl<_ItemList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemListToJson(this);
  }
}

abstract class _ItemList implements ItemList {
  const factory _ItemList(List<Item> items) = _$_ItemList;

  factory _ItemList.fromJson(Map<String, dynamic> json) = _$_ItemList.fromJson;

  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemListCopyWith<_ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(String name, String category, int tier,
      List<Ingredient>? ingredients, bool? hidden) {
    return _Item(
      name,
      category,
      tier,
      ingredients,
      hidden,
    );
  }

  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get tier => throw _privateConstructorUsedError;
  List<Ingredient>? get ingredients => throw _privateConstructorUsedError;
  bool? get hidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String category,
      int tier,
      List<Ingredient>? ingredients,
      bool? hidden});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? category = freezed,
    Object? tier = freezed,
    Object? ingredients = freezed,
    Object? hidden = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tier: tier == freezed
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
      hidden: hidden == freezed
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String category,
      int tier,
      List<Ingredient>? ingredients,
      bool? hidden});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object? name = freezed,
    Object? category = freezed,
    Object? tier = freezed,
    Object? ingredients = freezed,
    Object? hidden = freezed,
  }) {
    return _then(_Item(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tier == freezed
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
      hidden == freezed
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      this.name, this.category, this.tier, this.ingredients, this.hidden);

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String name;
  @override
  final String category;
  @override
  final int tier;
  @override
  final List<Ingredient>? ingredients;
  @override
  final bool? hidden;

  @override
  String toString() {
    return 'Item(name: $name, category: $category, tier: $tier, ingredients: $ingredients, hidden: $hidden)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.tier, tier) ||
                const DeepCollectionEquality().equals(other.tier, tier)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.hidden, hidden) ||
                const DeepCollectionEquality().equals(other.hidden, hidden)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(tier) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(hidden);

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item(String name, String category, int tier,
      List<Ingredient>? ingredients, bool? hidden) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  int get tier => throw _privateConstructorUsedError;
  @override
  List<Ingredient>? get ingredients => throw _privateConstructorUsedError;
  @override
  bool? get hidden => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}

ItemCategory _$ItemCategoryFromJson(Map<String, dynamic> json) {
  return _ItemCategory.fromJson(json);
}

/// @nodoc
class _$ItemCategoryTearOff {
  const _$ItemCategoryTearOff();

  _ItemCategory call(String name, int order) {
    return _ItemCategory(
      name,
      order,
    );
  }

  ItemCategory fromJson(Map<String, Object> json) {
    return ItemCategory.fromJson(json);
  }
}

/// @nodoc
const $ItemCategory = _$ItemCategoryTearOff();

/// @nodoc
mixin _$ItemCategory {
  String get name => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCategoryCopyWith<ItemCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryCopyWith<$Res> {
  factory $ItemCategoryCopyWith(
          ItemCategory value, $Res Function(ItemCategory) then) =
      _$ItemCategoryCopyWithImpl<$Res>;
  $Res call({String name, int order});
}

/// @nodoc
class _$ItemCategoryCopyWithImpl<$Res> implements $ItemCategoryCopyWith<$Res> {
  _$ItemCategoryCopyWithImpl(this._value, this._then);

  final ItemCategory _value;
  // ignore: unused_field
  final $Res Function(ItemCategory) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ItemCategoryCopyWith<$Res>
    implements $ItemCategoryCopyWith<$Res> {
  factory _$ItemCategoryCopyWith(
          _ItemCategory value, $Res Function(_ItemCategory) then) =
      __$ItemCategoryCopyWithImpl<$Res>;
  @override
  $Res call({String name, int order});
}

/// @nodoc
class __$ItemCategoryCopyWithImpl<$Res> extends _$ItemCategoryCopyWithImpl<$Res>
    implements _$ItemCategoryCopyWith<$Res> {
  __$ItemCategoryCopyWithImpl(
      _ItemCategory _value, $Res Function(_ItemCategory) _then)
      : super(_value, (v) => _then(v as _ItemCategory));

  @override
  _ItemCategory get _value => super._value as _ItemCategory;

  @override
  $Res call({
    Object? name = freezed,
    Object? order = freezed,
  }) {
    return _then(_ItemCategory(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemCategory implements _ItemCategory {
  const _$_ItemCategory(this.name, this.order);

  factory _$_ItemCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ItemCategoryFromJson(json);

  @override
  final String name;
  @override
  final int order;

  @override
  String toString() {
    return 'ItemCategory(name: $name, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemCategory &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(order);

  @JsonKey(ignore: true)
  @override
  _$ItemCategoryCopyWith<_ItemCategory> get copyWith =>
      __$ItemCategoryCopyWithImpl<_ItemCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemCategoryToJson(this);
  }
}

abstract class _ItemCategory implements ItemCategory {
  const factory _ItemCategory(String name, int order) = _$_ItemCategory;

  factory _ItemCategory.fromJson(Map<String, dynamic> json) =
      _$_ItemCategory.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get order => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCategoryCopyWith<_ItemCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemCategoryList _$ItemCategoryListFromJson(Map<String, dynamic> json) {
  return _ItemCategoryList.fromJson(json);
}

/// @nodoc
class _$ItemCategoryListTearOff {
  const _$ItemCategoryListTearOff();

  _ItemCategoryList call(List<ItemCategory> categories) {
    return _ItemCategoryList(
      categories,
    );
  }

  ItemCategoryList fromJson(Map<String, Object> json) {
    return ItemCategoryList.fromJson(json);
  }
}

/// @nodoc
const $ItemCategoryList = _$ItemCategoryListTearOff();

/// @nodoc
mixin _$ItemCategoryList {
  List<ItemCategory> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCategoryListCopyWith<ItemCategoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryListCopyWith<$Res> {
  factory $ItemCategoryListCopyWith(
          ItemCategoryList value, $Res Function(ItemCategoryList) then) =
      _$ItemCategoryListCopyWithImpl<$Res>;
  $Res call({List<ItemCategory> categories});
}

/// @nodoc
class _$ItemCategoryListCopyWithImpl<$Res>
    implements $ItemCategoryListCopyWith<$Res> {
  _$ItemCategoryListCopyWithImpl(this._value, this._then);

  final ItemCategoryList _value;
  // ignore: unused_field
  final $Res Function(ItemCategoryList) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>,
    ));
  }
}

/// @nodoc
abstract class _$ItemCategoryListCopyWith<$Res>
    implements $ItemCategoryListCopyWith<$Res> {
  factory _$ItemCategoryListCopyWith(
          _ItemCategoryList value, $Res Function(_ItemCategoryList) then) =
      __$ItemCategoryListCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemCategory> categories});
}

/// @nodoc
class __$ItemCategoryListCopyWithImpl<$Res>
    extends _$ItemCategoryListCopyWithImpl<$Res>
    implements _$ItemCategoryListCopyWith<$Res> {
  __$ItemCategoryListCopyWithImpl(
      _ItemCategoryList _value, $Res Function(_ItemCategoryList) _then)
      : super(_value, (v) => _then(v as _ItemCategoryList));

  @override
  _ItemCategoryList get _value => super._value as _ItemCategoryList;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_ItemCategoryList(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemCategoryList implements _ItemCategoryList {
  const _$_ItemCategoryList(this.categories);

  factory _$_ItemCategoryList.fromJson(Map<String, dynamic> json) =>
      _$$_ItemCategoryListFromJson(json);

  @override
  final List<ItemCategory> categories;

  @override
  String toString() {
    return 'ItemCategoryList(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemCategoryList &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  _$ItemCategoryListCopyWith<_ItemCategoryList> get copyWith =>
      __$ItemCategoryListCopyWithImpl<_ItemCategoryList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemCategoryListToJson(this);
  }
}

abstract class _ItemCategoryList implements ItemCategoryList {
  const factory _ItemCategoryList(List<ItemCategory> categories) =
      _$_ItemCategoryList;

  factory _ItemCategoryList.fromJson(Map<String, dynamic> json) =
      _$_ItemCategoryList.fromJson;

  @override
  List<ItemCategory> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCategoryListCopyWith<_ItemCategoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call(String name, int quantity, {int completedAmount = 0}) {
    return _Ingredient(
      name,
      quantity,
      completedAmount: completedAmount,
    );
  }

  Ingredient fromJson(Map<String, Object> json) {
    return Ingredient.fromJson(json);
  }
}

/// @nodoc
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get completedAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call({String name, int quantity, int completedAmount});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
    Object? completedAmount = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      completedAmount: completedAmount == freezed
          ? _value.completedAmount
          : completedAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call({String name, int quantity, int completedAmount});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
    Object? completedAmount = freezed,
  }) {
    return _then(_Ingredient(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      completedAmount: completedAmount == freezed
          ? _value.completedAmount
          : completedAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ingredient implements _Ingredient {
  const _$_Ingredient(this.name, this.quantity, {this.completedAmount = 0});

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientFromJson(json);

  @override
  final String name;
  @override
  final int quantity;
  @JsonKey(defaultValue: 0)
  @override
  final int completedAmount;

  @override
  String toString() {
    return 'Ingredient(name: $name, quantity: $quantity, completedAmount: $completedAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ingredient &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.completedAmount, completedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.completedAmount, completedAmount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(completedAmount);

  @JsonKey(ignore: true)
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientToJson(this);
  }
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient(String name, int quantity, {int completedAmount}) =
      _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  int get completedAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) {
  return _ShoppingItem.fromJson(json);
}

/// @nodoc
class _$ShoppingItemTearOff {
  const _$ShoppingItemTearOff();

  _ShoppingItem call(String id, String name, int amount, String location,
      {int completedAmount = 0,
      int factor = 1,
      List<ShoppingItem> ingredients = const []}) {
    return _ShoppingItem(
      id,
      name,
      amount,
      location,
      completedAmount: completedAmount,
      factor: factor,
      ingredients: ingredients,
    );
  }

  ShoppingItem fromJson(Map<String, Object> json) {
    return ShoppingItem.fromJson(json);
  }
}

/// @nodoc
const $ShoppingItem = _$ShoppingItemTearOff();

/// @nodoc
mixin _$ShoppingItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get completedAmount => throw _privateConstructorUsedError;
  int get factor => throw _privateConstructorUsedError;
  List<ShoppingItem> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingItemCopyWith<ShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCopyWith<$Res> {
  factory $ShoppingItemCopyWith(
          ShoppingItem value, $Res Function(ShoppingItem) then) =
      _$ShoppingItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int amount,
      String location,
      int completedAmount,
      int factor,
      List<ShoppingItem> ingredients});
}

/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res> implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._value, this._then);

  final ShoppingItem _value;
  // ignore: unused_field
  final $Res Function(ShoppingItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? location = freezed,
    Object? completedAmount = freezed,
    Object? factor = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      completedAmount: completedAmount == freezed
          ? _value.completedAmount
          : completedAmount // ignore: cast_nullable_to_non_nullable
              as int,
      factor: factor == freezed
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingItemCopyWith<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  factory _$ShoppingItemCopyWith(
          _ShoppingItem value, $Res Function(_ShoppingItem) then) =
      __$ShoppingItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int amount,
      String location,
      int completedAmount,
      int factor,
      List<ShoppingItem> ingredients});
}

/// @nodoc
class __$ShoppingItemCopyWithImpl<$Res> extends _$ShoppingItemCopyWithImpl<$Res>
    implements _$ShoppingItemCopyWith<$Res> {
  __$ShoppingItemCopyWithImpl(
      _ShoppingItem _value, $Res Function(_ShoppingItem) _then)
      : super(_value, (v) => _then(v as _ShoppingItem));

  @override
  _ShoppingItem get _value => super._value as _ShoppingItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? location = freezed,
    Object? completedAmount = freezed,
    Object? factor = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_ShoppingItem(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      completedAmount: completedAmount == freezed
          ? _value.completedAmount
          : completedAmount // ignore: cast_nullable_to_non_nullable
              as int,
      factor: factor == freezed
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShoppingItem extends _ShoppingItem {
  const _$_ShoppingItem(this.id, this.name, this.amount, this.location,
      {this.completedAmount = 0, this.factor = 1, this.ingredients = const []})
      : super._();

  factory _$_ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$$_ShoppingItemFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int amount;
  @override
  final String location;
  @JsonKey(defaultValue: 0)
  @override
  final int completedAmount;
  @JsonKey(defaultValue: 1)
  @override
  final int factor;
  @JsonKey(defaultValue: const [])
  @override
  final List<ShoppingItem> ingredients;

  @override
  String toString() {
    return 'ShoppingItem(id: $id, name: $name, amount: $amount, location: $location, completedAmount: $completedAmount, factor: $factor, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.completedAmount, completedAmount) ||
                const DeepCollectionEquality()
                    .equals(other.completedAmount, completedAmount)) &&
            (identical(other.factor, factor) ||
                const DeepCollectionEquality().equals(other.factor, factor)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(completedAmount) ^
      const DeepCollectionEquality().hash(factor) ^
      const DeepCollectionEquality().hash(ingredients);

  @JsonKey(ignore: true)
  @override
  _$ShoppingItemCopyWith<_ShoppingItem> get copyWith =>
      __$ShoppingItemCopyWithImpl<_ShoppingItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShoppingItemToJson(this);
  }
}

abstract class _ShoppingItem extends ShoppingItem {
  const factory _ShoppingItem(
      String id, String name, int amount, String location,
      {int completedAmount,
      int factor,
      List<ShoppingItem> ingredients}) = _$_ShoppingItem;
  const _ShoppingItem._() : super._();

  factory _ShoppingItem.fromJson(Map<String, dynamic> json) =
      _$_ShoppingItem.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  int get completedAmount => throw _privateConstructorUsedError;
  @override
  int get factor => throw _privateConstructorUsedError;
  @override
  List<ShoppingItem> get ingredients => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShoppingItemCopyWith<_ShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationList _$LocationListFromJson(Map<String, dynamic> json) {
  return _LocationList.fromJson(json);
}

/// @nodoc
class _$LocationListTearOff {
  const _$LocationListTearOff();

  _LocationList call(List<String> locations) {
    return _LocationList(
      locations,
    );
  }

  LocationList fromJson(Map<String, Object> json) {
    return LocationList.fromJson(json);
  }
}

/// @nodoc
const $LocationList = _$LocationListTearOff();

/// @nodoc
mixin _$LocationList {
  List<String> get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationListCopyWith<LocationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationListCopyWith<$Res> {
  factory $LocationListCopyWith(
          LocationList value, $Res Function(LocationList) then) =
      _$LocationListCopyWithImpl<$Res>;
  $Res call({List<String> locations});
}

/// @nodoc
class _$LocationListCopyWithImpl<$Res> implements $LocationListCopyWith<$Res> {
  _$LocationListCopyWithImpl(this._value, this._then);

  final LocationList _value;
  // ignore: unused_field
  final $Res Function(LocationList) _then;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$LocationListCopyWith<$Res>
    implements $LocationListCopyWith<$Res> {
  factory _$LocationListCopyWith(
          _LocationList value, $Res Function(_LocationList) then) =
      __$LocationListCopyWithImpl<$Res>;
  @override
  $Res call({List<String> locations});
}

/// @nodoc
class __$LocationListCopyWithImpl<$Res> extends _$LocationListCopyWithImpl<$Res>
    implements _$LocationListCopyWith<$Res> {
  __$LocationListCopyWithImpl(
      _LocationList _value, $Res Function(_LocationList) _then)
      : super(_value, (v) => _then(v as _LocationList));

  @override
  _LocationList get _value => super._value as _LocationList;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_LocationList(
      locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationList implements _LocationList {
  const _$_LocationList(this.locations);

  factory _$_LocationList.fromJson(Map<String, dynamic> json) =>
      _$$_LocationListFromJson(json);

  @override
  final List<String> locations;

  @override
  String toString() {
    return 'LocationList(locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationList &&
            (identical(other.locations, locations) ||
                const DeepCollectionEquality()
                    .equals(other.locations, locations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(locations);

  @JsonKey(ignore: true)
  @override
  _$LocationListCopyWith<_LocationList> get copyWith =>
      __$LocationListCopyWithImpl<_LocationList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationListToJson(this);
  }
}

abstract class _LocationList implements LocationList {
  const factory _LocationList(List<String> locations) = _$_LocationList;

  factory _LocationList.fromJson(Map<String, dynamic> json) =
      _$_LocationList.fromJson;

  @override
  List<String> get locations => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationListCopyWith<_LocationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$IngredientListEntryTearOff {
  const _$IngredientListEntryTearOff();

  _IngredientListEntry call(int amount, bool complete) {
    return _IngredientListEntry(
      amount,
      complete,
    );
  }
}

/// @nodoc
const $IngredientListEntry = _$IngredientListEntryTearOff();

/// @nodoc
mixin _$IngredientListEntry {
  int get amount => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientListEntryCopyWith<IngredientListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListEntryCopyWith<$Res> {
  factory $IngredientListEntryCopyWith(
          IngredientListEntry value, $Res Function(IngredientListEntry) then) =
      _$IngredientListEntryCopyWithImpl<$Res>;
  $Res call({int amount, bool complete});
}

/// @nodoc
class _$IngredientListEntryCopyWithImpl<$Res>
    implements $IngredientListEntryCopyWith<$Res> {
  _$IngredientListEntryCopyWithImpl(this._value, this._then);

  final IngredientListEntry _value;
  // ignore: unused_field
  final $Res Function(IngredientListEntry) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? complete = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      complete: complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$IngredientListEntryCopyWith<$Res>
    implements $IngredientListEntryCopyWith<$Res> {
  factory _$IngredientListEntryCopyWith(_IngredientListEntry value,
          $Res Function(_IngredientListEntry) then) =
      __$IngredientListEntryCopyWithImpl<$Res>;
  @override
  $Res call({int amount, bool complete});
}

/// @nodoc
class __$IngredientListEntryCopyWithImpl<$Res>
    extends _$IngredientListEntryCopyWithImpl<$Res>
    implements _$IngredientListEntryCopyWith<$Res> {
  __$IngredientListEntryCopyWithImpl(
      _IngredientListEntry _value, $Res Function(_IngredientListEntry) _then)
      : super(_value, (v) => _then(v as _IngredientListEntry));

  @override
  _IngredientListEntry get _value => super._value as _IngredientListEntry;

  @override
  $Res call({
    Object? amount = freezed,
    Object? complete = freezed,
  }) {
    return _then(_IngredientListEntry(
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IngredientListEntry implements _IngredientListEntry {
  const _$_IngredientListEntry(this.amount, this.complete);

  @override
  final int amount;
  @override
  final bool complete;

  @override
  String toString() {
    return 'IngredientListEntry(amount: $amount, complete: $complete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IngredientListEntry &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.complete, complete) ||
                const DeepCollectionEquality()
                    .equals(other.complete, complete)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(complete);

  @JsonKey(ignore: true)
  @override
  _$IngredientListEntryCopyWith<_IngredientListEntry> get copyWith =>
      __$IngredientListEntryCopyWithImpl<_IngredientListEntry>(
          this, _$identity);
}

abstract class _IngredientListEntry implements IngredientListEntry {
  const factory _IngredientListEntry(int amount, bool complete) =
      _$_IngredientListEntry;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  bool get complete => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IngredientListEntryCopyWith<_IngredientListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
