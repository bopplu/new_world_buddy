import 'package:flutter/cupertino.dart';

@immutable
class ShoppingItem {
  final String name;
  final int amount;
  final bool complete;

  const ShoppingItem(this.name, this.amount, this.complete);
}

class ShoppingListModel extends ChangeNotifier {
  final List<ShoppingItem> _items = [
    ShoppingItem('Green Wood', 100, true),
    ShoppingItem('Iron Ore', 500, false),
    ShoppingItem('Common Health Potion', 15, false),
  ];

  List<ShoppingItem> get items {
    return [..._items];
  }

  ShoppingItem getByPosition(index) {
    final item = _items[index];
    return ShoppingItem(item.name, item.amount, item.complete);
  }

  void clearList() {
    _items.clear();
    notifyListeners();
  }

  void addItem(String name, int amount) {
    final ShoppingItem? item = _items.cast<ShoppingItem?>().firstWhere(
        (element) => (element?.name ?? '') == name,
        orElse: () => null);
    final int restAmount = !item!.complete ? item.amount : 0;
    if (item.complete) {
      _items.remove(item);
    }
    _items.add(ShoppingItem(name, amount + restAmount, false));
    notifyListeners();
  }
}
