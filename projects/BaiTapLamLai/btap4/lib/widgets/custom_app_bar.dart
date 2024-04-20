import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onPressedOfSearchButton,
    required this.onPressOfQuestionMarkButton,
  });

  final VoidCallback onPressedOfSearchButton;
  final VoidCallback onPressOfQuestionMarkButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Know Your Goverment",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.purple,
      actions: [
        IconButton(
          onPressed: onPressedOfSearchButton,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onPressOfQuestionMarkButton,
          icon: const Icon(
            Icons.question_mark,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
