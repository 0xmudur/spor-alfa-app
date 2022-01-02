import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_app_bar.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/view/detail_view/detail_view.dart';
import 'package:spor_alfa_app/view/home_view/widget/news_focus_widget.dart';
import 'package:spor_alfa_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';
import '../../service_locator.dart';

class CategoryViewWithId extends StatefulWidget {
  int id;

  CategoryViewWithId(this.id);

  @override
  _CategoryViewWithIdState createState() => _CategoryViewWithIdState();
}

class _CategoryViewWithIdState extends State<CategoryViewWithId> {
  CategoriesViewModel viewModel = serviceLocator<CategoriesViewModel>();

  @override
  void initState() {
    viewModel.getNewsWithCategoryId(widget.id, 10, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesViewModel>(
        create: (context) => viewModel,
        child: Consumer<CategoriesViewModel>(
          builder: (context, model, child) => Scaffold(
            appBar: SporAlfaAppBar(),
            body: viewModel.currentState == CurrentState.loading
                ? Container(child: Center(child: SporAlfaProgressBar()))
                : ListView.builder(
                    itemCount: viewModel.filteredNews.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailView(
                                    title: viewModel.filteredNews[index].title,
                                    imgFilePath:
                                    viewModel.filteredNews[index].imageSrc,
                                    body: viewModel.filteredNews[index].body,
                                    publishedAt: viewModel
                                        .filteredNews[index].publishedAt
                                        .toString()))),
                        child: NewsFocusWidget(
                            title: viewModel.filteredNews[index].title,
                            imageFilePath: viewModel.filteredNews[index].imageSrc),
                      ),
                    )),
          ),
        ));
  }
}
