import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_world_buddy/catalog/catalog_model.dart';
import 'package:new_world_buddy/catalog/item.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

useConvertItem(Item item, int amount, location) => useCallback(() {
      return ShoppingItem(_uuid.v4(), item.name, amount, location,
          ingredients: item.ingredients?.map((e) => _convertIngredient(e, amount, location)).toList() ?? []);
    }, [item, amount, location])();

ShoppingItem _convertIngredient(Ingredient ingredient, int amount, String location) {
  final ingredientItem = useProvider(itemProvider(ingredient.name))!;
  final ingredientsOfIngredient =
      ingredientItem.ingredients?.map((e) => _convertIngredient(e, ingredient.quantity * amount, location)).toList() ??
          [];
  return ShoppingItem(_uuid.v4(), ingredient.name, ingredient.quantity * amount, location,
      ingredients: ingredientsOfIngredient, factor: ingredient.quantity);
}
