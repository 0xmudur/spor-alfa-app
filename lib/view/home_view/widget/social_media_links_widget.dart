import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';

class SocialMediaLinksWidget extends StatelessWidget {
  const SocialMediaLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:
      Row(children: [
        Expanded(child: Image.asset("assets/images/icons8-facebook-240.png",height: 40, width: 40,)),
        Expanded(child: Image.asset("assets/images/icons8-twitter-240.png",height: 40, width: 40,)),
        Expanded(child: Image.asset("assets/images/icons8-instagram-240.png",height: 40, width: 40,))
      ],),
    );
  }
}
