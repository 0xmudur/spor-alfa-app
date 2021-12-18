import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';

class SporAlfaProgressBar extends StatelessWidget {
  const SporAlfaProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(SporAlfaTheme.primaryColor));
  }
}
