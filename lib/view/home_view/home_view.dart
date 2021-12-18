import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/view/home_view/widget/image_slider_widget.dart';
import 'package:spor_alfa_app/view/home_view/widget/social_media_links_widget.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';

import 'widget/news_container_focus_widget.dart';
import 'widget/news_container_more_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.getFocusNews();
    print(viewModel.focusNews);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(builder: (context, model, child) {
        return ListView(
          children: [
            /// HeadLine news
            viewModel.currentState == CurrentState.loading
                ? Container(
                    height: 250, child: Center(child: SporAlfaProgressBar()))
                : Container(
                    height: 250,
                    child: ImageSliderWidget(),
                  ),

            /// Focus news
            viewModel.currentState == CurrentState.loading
                ? Container(
                    height: 180, child: Center(child: SporAlfaProgressBar()))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: viewModel.focusNews.length,
                        itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.only(top: 8),
                              height: 180,
                              child: NewsContainerFocusWidget(
                                  title: viewModel.focusNews[index].title,
                                  imageFilePath:
                                      viewModel.focusNews[index].imageSrc),
                            )),
                  ),

            /// More news
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 90, child: NewsContainerMoreWidget()),
            ),

            /// Social media
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 30, child: SocialMediaLinksWidget()),
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
        // if (viewModel.currentState == CurrentState.loading){
        //   return Center(child: CircularProgressIndicator());
        //
        // } else if (viewModel.currentState == CurrentState.loaded) {
        //   print(viewModel.focusNews[0].title);
        //   return Center(child: Text("Data Loaded"));
        // }
        //
        // else {
        //   return Center(child: Text("Bir hata oluştu. Lütfen daha sonra tekar deneyin"),);
        // }
      }),
    );
  }
}
