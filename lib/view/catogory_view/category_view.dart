import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:spor_alfa_app/view_model/categories_view_model.dart';

import '../../service_locator.dart';

/// IF parent id == null => baseCategory
///

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
CategoriesViewModel viewModel = serviceLocator<CategoriesViewModel>();

  @override
  void initState() {
    viewModel.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          collapsedIconColor: SporAlfaTheme.primaryColor,
          collapsedTextColor: SporAlfaTheme.primaryColor,
          textColor: SporAlfaTheme.primaryColor,
          iconColor: SporAlfaTheme.primaryColor,
          title: Text('Category Name', style:TextStyle(fontWeight: FontWeight.bold),),
          children: [
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
              ],
            )
          ],
        ),
        ExpansionTile(
          collapsedIconColor: SporAlfaTheme.primaryColor,
          collapsedTextColor: SporAlfaTheme.primaryColor,
          textColor: SporAlfaTheme.primaryColor,
          iconColor: SporAlfaTheme.primaryColor,
          title: Text('Category Name', style:TextStyle(fontWeight: FontWeight.bold),),
          children: [
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
              ],
            )
          ],
        ),
        ExpansionTile(
          collapsedIconColor: SporAlfaTheme.primaryColor,
          collapsedTextColor: SporAlfaTheme.primaryColor,
          textColor: SporAlfaTheme.primaryColor,
          iconColor: SporAlfaTheme.primaryColor,
          title: Text('Category Name', style:TextStyle(fontWeight: FontWeight.bold),),
          children: [
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Text('Subcategory'),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
