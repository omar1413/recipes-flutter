import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final Widget body;

  const Skelton({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: body,
    );
  }
}
