import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_progress_bar.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:spor_alfa_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../service_locator.dart';

class NewsMoreWidget extends StatefulWidget {
  String title;
  String imageFilePath;

  NewsMoreWidget({required this.title, required this.imageFilePath});

  @override
  State<NewsMoreWidget> createState() => _NewsMoreWidgetState();
}

class _NewsMoreWidgetState extends State<NewsMoreWidget> {
  HomeViewModel viewModel = serviceLocator<HomeViewModel>();

  @override
  void initState() {
    viewModel.getImageWithFilePath(widget.imageFilePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
          builder: (context, model, child) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                  viewModel.currentState == CurrentState.loading
                  ? Container(child: Center(child: SporAlfaProgressBar())) :
                      Expanded(
                        child:
                        ClipRRect(
                            child: Image.memory(viewModel.newsImage,
                                fit: BoxFit.fill, width: 1000.0)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.title,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("/",
                                      style: TextStyle(
                                        color: SporAlfaTheme.primaryColor,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(width: 3,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Football",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
      ),
    );
  }
}
