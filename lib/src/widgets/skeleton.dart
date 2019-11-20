import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final Widget body;
  final Widget title;
  final PreferredSizeWidget bottom;
  final Widget bottomNavigationBar;

  const Skeleton(
      {Key key, this.body, this.title, this.bottom, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null || bottom == null
          ? AppBar(
              title: title,
              bottom: bottom,
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 10),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    bottom,
                  ],
                ),
              ),
            ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
