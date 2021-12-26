import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_app_bar.dart';
import 'package:spor_alfa_app/view/home_view/widget/social_media_links_widget.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SporAlfaAppBar(),
      body: ListView(
        children: [
          Container(
            height: 250,
            color: Colors.red,
            // decoration: BoxDecoration(
            //   color: Colors.grey.shade300,
            // ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          ),
          SizedBox(height: 15),
          Text("title text", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          SizedBox(height: 15,),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: TextStyle(fontSize: 14)),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Yayinlanma tarihi", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),

              Row(
                children: [
                  Text("Paylaş", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),



        ],
      ),
    );
  }
}
