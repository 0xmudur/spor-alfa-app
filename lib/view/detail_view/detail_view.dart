import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_app_bar.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class DetailView extends StatefulWidget {
  String title;
  String imgFilePath;
  String body;
  String publishedAt;

  DetailView(
      {required this.title,
      required this.imgFilePath,
      required this.body,
      required this.publishedAt});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  HomeViewModel viewModel = serviceLocator<HomeViewModel>();

  @override
  void initState() {
    viewModel.getImageWithFilePath(widget.imgFilePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
          builder: (context, model, child) => Scaffold(
                appBar: SporAlfaAppBar(),
                body: ListView(
                  children: [
                    viewModel.currentState == CurrentState.loading
                        ? Container(
                            height: 250,
                            width: 250,
                            child: Center(child: SporAlfaProgressBar()))
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                child: Image.memory(viewModel.newsImage,
                                    fit: BoxFit.fill, width: 1000.0)),
                          ),
                    SizedBox(height: 15),
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(widget.body, style: TextStyle(fontSize: 14)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                  "Yayınlanma tarihi: ${widget.publishedAt.split(" ").first}",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Paylaş",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
