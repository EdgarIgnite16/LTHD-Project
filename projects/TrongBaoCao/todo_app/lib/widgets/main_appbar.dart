import 'package:flutter/material.dart';

import '../constrants/colors.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  String appBarTitle;

  MainAppBar({super.key, required this.appBarTitle});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.appBarTitle),
      actions: [
        SizedBox(
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/banner.jpeg'),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      // leading: const Icon(Icons.menu),
      elevation: 4,
      shadowColor: tdBlack,
    );
  }

}
