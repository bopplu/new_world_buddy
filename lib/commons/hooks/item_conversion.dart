import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

useConvertItem(WidgetRef ref, Item item, int amount, location) => useCallback(() {
      final itemId = _uuid.v4();
      return ShoppingItem(itemId, item.name, amount, location,
          ingredients: item.ingredients?.map((e) => _convertIngredient(ref, e, itemId, amount, location)).toList() ?? []);
    }, [item, amount, location])();

ShoppingItem _convertIngredient(WidgetRef ref, Ingredient ingredient, String parentId, int amount, String location) {
  final itemId = _uuid.v4();
  final ingredientItem = ref.watch(itemProvider(ingredient.name))!;
  final ingredientsOfIngredient = ingredientItem.ingredients
          ?.map((e) => _convertIngredient(ref, e, itemId, ingredient.quantity * amount, location))
          .toList() ??
      [];
  return ShoppingItem(itemId, ingredient.name, ingredient.quantity * amount, location,
      ingredients: ingredientsOfIngredient, factor: ingredient.quantity);
}
