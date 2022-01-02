import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:spor_alfa_app/view/catogory_view/category_view_with_id.dart';
import 'package:spor_alfa_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider<CategoriesViewModel>(
      create: (context) => viewModel,
      child: Consumer<CategoriesViewModel>(
          builder: (context, model, child) => ListView.builder(
              itemCount: viewModel.baseCategories.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  collapsedIconColor: SporAlfaTheme.primaryColor,
                  collapsedTextColor: SporAlfaTheme.primaryColor,
                  textColor: SporAlfaTheme.primaryColor,
                  iconColor: SporAlfaTheme.primaryColor,
                  title: Text(
                    viewModel.mergedCategories[index].keys.first.values.first,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListView.builder(
                        itemCount: viewModel
                            .mergedCategories[index].values.first.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, subIndex) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, bottom: 8),
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryViewWithId(viewModel
                                                  .mergedCategories[index]
                                                  .keys
                                                  .first
                                                  .keys
                                                  .first))),
                                  child: Text(viewModel.mergedCategories[index]
                                      .values.first[subIndex])),
                            ))
                  ],
                );
              })),
    );
  }
}
