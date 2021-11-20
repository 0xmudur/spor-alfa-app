import 'package:flutter/material.dart';
import 'package:spor_alfa_app/view/home_view/widget/image_slider_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spor_alfa_app/view/home_view/widget/social_media_links_widget.dart';

import 'widget/news_container_focus_widget.dart';
import 'widget/news_container_more_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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

        // IgnorePointer(
        //   child: GridView.count(
        //     shrinkWrap: true,
        //     crossAxisCount: 2,
        //     children: new List<Widget>.generate(4, (index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: new GridTile(
        //           child: new NewsContainerMoreWidget()
        //         ),
        //       );
        //     }),
        //   ),
        // ),
      ],
    );
  }
}
