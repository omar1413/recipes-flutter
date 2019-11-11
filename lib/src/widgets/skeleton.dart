import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final Widget body;
  final Widget title;

  const Skeleton({Key key, this.body, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: body,
    );
  }
}
