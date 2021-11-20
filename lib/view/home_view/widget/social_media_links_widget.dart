import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';

class SocialMediaLinksWidget extends StatelessWidget {
  const SocialMediaLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: SporAlfaTheme.primaryColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:
      Row(children: [
        Expanded(child: Image.asset("assets/images/icons8-facebook-240.png",height: 40, width: 40,)),
        Expanded(child: Image.asset("assets/images/icons8-twitter-240.png",height: 40, width: 40,)),
        Expanded(child: Image.asset("assets/images/icons8-instagram-240.png",height: 40, width: 40,))
      ],),
    );
  }
}
