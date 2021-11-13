import 'package:flutter/material.dart';

class SporAlfaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SporAlfaAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Spor Alfa App'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          onPressed: () {
            // FirebaseAuth.instance.signOut();
            // _confirmSignOutAlert(context);
          },
        ),
      ],
    );
  }
}