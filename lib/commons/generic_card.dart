import 'package:flutter/material.dart';

class Gcard {
  final String name;
  final String url;

  Gcard({required this.name, required this.url});
}

class GenericCard extends StatelessWidget {
  final Gcard cardInfo;

  const GenericCard(this.cardInfo, {Key? key}) : super(key: key);

  void selectSection(ctx) {
    Navigator.of(ctx).pushNamed(cardInfo.url, arguments: cardInfo);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Theme.of(context).canvasColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cardInfo.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectSection(context),
    );
  }
}
