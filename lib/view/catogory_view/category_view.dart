import 'package:flutter/material.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(title: Text('Category Name'), children: [
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
            Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
          ],)
        ],),
        ExpansionTile(title: Text('Category Name'), children: [
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            ],)
        ],),
        ExpansionTile(title: Text('Category Name'), children: [
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            ],)
        ],),
        ExpansionTile(title: Text('Category Name'), children: [
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
              Padding(padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8 ), child: Text('Subcategory'),),
            ],)
        ],),

      ],
    );
  }
}
