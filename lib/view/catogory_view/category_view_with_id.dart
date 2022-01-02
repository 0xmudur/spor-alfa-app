import 'package:flutter/material.dart';

class CategoryViewWithId extends StatefulWidget {
  int id;

  CategoryViewWithId(this.id);

  @override
  _CategoryViewWithIdState createState() => _CategoryViewWithIdState();
}

class _CategoryViewWithIdState extends State<CategoryViewWithId> {
  @override
  Widget build(BuildContext context) {
    print(widget.id.toString());
    return Container();
  }
}
