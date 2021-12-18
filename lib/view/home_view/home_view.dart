import 'package:flutter/material.dart';
import 'package:spor_alfa_app/service/web_service.dart';
import 'package:spor_alfa_app/view/home_view/widget/image_slider_widget.dart';
import 'package:spor_alfa_app/view/home_view/widget/social_media_links_widget.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';

import '../../service_locator.dart';
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
    viewModel.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: ListView(
        children: [
          Container(
            height: 250,
            child: ImageSliderWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 180, child: NewsContainerFocusWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 180, child: NewsContainerFocusWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 90, child: NewsContainerMoreWidget()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 90, child: NewsContainerMoreWidget()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 30 ,child: SocialMediaLinksWidget()),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
