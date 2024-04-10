import 'package:flutter/material.dart';

class StepperButton extends StatelessWidget {
  const StepperButton({
    super.key,
    required this.onPress,
    required this.icon,
  });

  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 20,
        ),
      ),
    );
  }
}
