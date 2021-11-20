import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FixtureView extends StatefulWidget {
  @override
  State<FixtureView> createState() => _FixtureViewState();
}

class _FixtureViewState extends State<FixtureView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
              height: 40,

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){}, child: Text('Süper Lig'), style: ElevatedButton.styleFrom(primary: SporAlfaTheme.primaryColor,),),
                ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){}, child: Text('Türkiye Kupası'), style: ElevatedButton.styleFrom(primary: SporAlfaTheme.primaryColor,),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){}, child: Text('1. Lig'), style: ElevatedButton.styleFrom(primary: SporAlfaTheme.primaryColor,),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){}, child: Text('Süper Kupa'), style: ElevatedButton.styleFrom(primary: SporAlfaTheme.primaryColor,),),
                  ),



              ],),
            ),
          ),
          Container(
            height: 500,
            // or any other height

            // need to leave blank space on sides so the whole screen could be scrollable
            child: WebView(
              // this makes inside of webView scrollable
              initialUrl: Uri.dataFromString('<html><body><div id="scoreaxis-widget-a8027" data-reactroot=""><iframe id="Iframe" src="https://www.scoreaxis.com/widget/standings-widget/600?borderColor=%23194d33&amp;fontSize=25&amp;links=0&amp;inst=a8027" style="width:100%;border:none;transition:all 300ms ease"></iframe><script>window.addEventListener("DOMContentLoaded",event=>{window.addEventListener("message",event=>{if(event.data.appHeight&&"a8027"==event.data.inst){let container=document.querySelector("#scoreaxis-widget-a8027 iframe");container&&(container.style.height=parseInt(event.data.appHeight)+"px")}},!1)});</script></div></body></html>', mimeType: 'text/html').toString(),
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
