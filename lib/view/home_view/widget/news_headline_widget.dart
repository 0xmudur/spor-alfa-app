import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';

class NewsHeadlineWidget extends StatefulWidget {
  HomeViewModel viewModel;

  NewsHeadlineWidget({required this.viewModel});

  @override
  State<NewsHeadlineWidget> createState() => _NewsHeadlineWidgetState();
}

class _NewsHeadlineWidgetState extends State<NewsHeadlineWidget> {
  final CarouselController _controller = CarouselController();

  int _current = 0;
  List imgList = [];

  @override
  void initState() {
    imgList = widget.viewModel.headlineImages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = imgList.asMap().entries.map((item) => Container(
      child: Stack(
        children: <Widget>[
          Image.memory(item.value, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child:  Text(
                widget.viewModel.headlineNews[item.key].news.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    )).toList();



    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: false,
              aspectRatio: 1.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 18.0,
              height: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
