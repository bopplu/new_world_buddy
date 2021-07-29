import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shopping_list_model.dart';

class ShoppingRow extends StatelessWidget {
  final int index;

  const ShoppingRow(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingListModel = context.read<ShoppingListModel>();
    final item = shoppingListModel.getByPosition(index);

    final textStyle = Theme.of(context).textTheme.bodyText1;
    final textStyleStrikethrough = textStyle!.copyWith(decoration: TextDecoration.lineThrough);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: item.amount.toString()),
            const WidgetSpan(
              child: SizedBox(
                width: 30,
              ),
            ),
            TextSpan(text: item.name)
          ],
          style: item.complete ? textStyleStrikethrough : textStyle,
        ),
      ),
    );
  }
}
