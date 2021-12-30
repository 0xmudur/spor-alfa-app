import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/view/detail_view/detail_view.dart';
import 'package:spor_alfa_app/view/home_view/widget/news_headline_widget.dart';
import 'package:spor_alfa_app/view/home_view/widget/social_media_links_widget.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';

import '../../service_locator.dart';
import 'widget/news_focus_widget.dart';
import 'widget/news_more_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = serviceLocator<HomeViewModel>();
  int moreNewsSkip = 3;

  @override
  void initState() {
    viewModel.getHeadlineNews(5, 0);
    viewModel.getFocusNews(5, 0);
    viewModel.getMoreNews(3, 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(builder: (context, model, child) {
        return NotificationListener<ScrollEndNotification>(
          onNotification: (scrollEnd) {
            var metrics = scrollEnd.metrics;
            if (metrics.atEdge) {
              if (metrics.pixels == 0) {
                print('At top');
              } else {
                moreNewsSkip += 3;
                viewModel.getMoreNews(3, 5 + moreNewsSkip);
              }
            }
            return true;
          },
          child: ListView(
            children: [
              /// HeadLine news
              viewModel.currentState == CurrentState.loading
                  ? Container(
                      height: 250, child: Center(child: SporAlfaProgressBar()))
                  : Container(
                      height: 250,
                      child: InkWell(
                          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(viewModel: viewModel,))),
                          child: NewsHeadlineWidget(viewModel: viewModel)),
                    ),

              /// Focus news
              viewModel.currentState == CurrentState.loading
                  ? Container(
                      height: 220, child: Center(child: SporAlfaProgressBar()))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: viewModel.focusNews.length,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.only(top: 8),
                          height: 220,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailView(
                                        title: viewModel.focusNews[index].title,
                                        imgFilePath:
                                            viewModel.focusNews[index].imageSrc,
                                        body: viewModel.focusNews[index].body,
                                        publishedAt: viewModel
                                            .focusNews[index].publishedAt
                                            .toString()))),
                            child: NewsFocusWidget(
                                title: viewModel.focusNews[index].title,
                                imageFilePath:
                                    viewModel.focusNews[index].imageSrc),
                          ),
                        ),
                      ),
                    ),

              /// More news
              viewModel.currentState == CurrentState.loading
                  ? Container(
                      height: 220, child: Center(child: SporAlfaProgressBar()))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: viewModel.moreNews.length,
                        itemBuilder: (context, index) => Container(
                            height: 90,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailView(
                                          title:
                                              viewModel.focusNews[index].title,
                                          imgFilePath: viewModel
                                              .focusNews[index].imageSrc,
                                          body: viewModel.focusNews[index].body,
                                          publishedAt: viewModel
                                              .focusNews[index].publishedAt
                                              .toString()))),
                              child: NewsMoreWidget(
                                  title: viewModel.moreNews[index].title,
                                  imageFilePath:
                                      viewModel.moreNews[index].imageSrc),
                            )),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
