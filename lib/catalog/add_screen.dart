import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Column(
        children: [
          SizedBox(),
          GridView.count(
            crossAxisCount: 6,
            children: [AdderCard(1), AdderCard(5), AdderCard(10), AdderCard(30), AdderCard(50), AdderCard(100)],
          ),
        ],
      ),
    );
  }
}

class AdderCard extends StatelessWidget {
  final int toAdd;

  const AdderCard(this.toAdd, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(toAdd.toString()),
    );
  }
}
