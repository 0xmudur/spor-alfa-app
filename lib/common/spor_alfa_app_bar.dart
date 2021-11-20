import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';

class SporAlfaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SporAlfaAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SporAlfaTheme.primaryColor,
      centerTitle: true,
      title: const Text('Spor Alfa App'),

    );
  }
}