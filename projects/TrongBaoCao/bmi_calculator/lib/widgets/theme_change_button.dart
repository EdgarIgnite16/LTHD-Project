import 'package:bmi_calculator/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Thiết lập Theme Controller
    ThemeController themeController = Get.put(ThemeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () => themeController.changeTheme(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Dark Theme
                Icon(
                  Icons.dark_mode,
                  color: themeController.isDark.value ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(width: 10),

                /// Light Theme
                Icon(
                  Icons.light_mode,
                  color: themeController.isDark.value ? Theme.of(context).colorScheme.onSecondaryContainer : Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
