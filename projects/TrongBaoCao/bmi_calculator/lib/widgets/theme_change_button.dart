import 'package:flutter/material.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.dark_mode),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.light_mode),
              ),
            ],
          ),
        )
      ],
    );
  }
}
