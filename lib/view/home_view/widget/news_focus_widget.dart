import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../service_locator.dart';

class NewsFocusWidget extends StatefulWidget {
  String title;
  String imageFilePath;

  NewsFocusWidget({required this.title, required this.imageFilePath});

  @override
  _NewsFocusWidgetState createState() => _NewsFocusWidgetState();

}

class _NewsFocusWidgetState extends State<NewsFocusWidget> {
  HomeViewModel viewModel = serviceLocator<HomeViewModel>();

  @override
  void initState() {
    viewModel.getImageWithFilePath(widget.imageFilePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Container(
          child: Stack(
            children: [
              viewModel.currentState == CurrentState.loading
                  ? Container(child: Center(child: SporAlfaProgressBar())) :
              ClipRRect(
                  child: Image.memory(viewModel.newsImage,
                      fit: BoxFit.fill, width: 1000.0)),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
