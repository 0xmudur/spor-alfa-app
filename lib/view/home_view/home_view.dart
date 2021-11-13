import 'package:flutter/material.dart';
import 'package:spor_alfa_app/view/home_view/widget/image_slider_widget.dart';
import 'package:spor_alfa_app/view/home_view/widget/news_container_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
      Container(height: 250,child: ImageSliderWidget(),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(height: 250,child: NewsContainerWidget(maxTitleLine: 3,),),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(height: 250,child: NewsContainerWidget(maxTitleLine: 3,),),
      ),
      IgnorePointer(
        child: GridView.count(

          shrinkWrap: true,
          crossAxisCount: 2,
          children: new List<Widget>.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new GridTile(
                child: new NewsContainerWidget(maxTitleLine: 2,)
              ),
            );
          }),
        ),
      ),

    ],);
  }
}

