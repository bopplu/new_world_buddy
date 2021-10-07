import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LocationScreen extends HookWidget {
  final String route = '/locations';

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Text('locations');
        },
      ),
    );
  }
}
