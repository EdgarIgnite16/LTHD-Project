import 'package:bmi_calculator/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PrimaryButton(
          icon: Icons.male,
          btnName: 'Male',
        ),
        SizedBox(width: 20),
        PrimaryButton(
          icon: Icons.female,
          btnName: 'Female',
        ),
      ],
    );
  }
}
