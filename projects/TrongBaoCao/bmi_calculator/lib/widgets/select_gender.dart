import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/widgets/select_gender_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Row(
      children: [
        /// Nam
        SelectGenderButton(
          icon: Icons.male,
          btnName: 'Male',
          onPress: () => bmiController.genderHandle("Male"),
        ),
        const SizedBox(width: 20),

        /// Nữ
        SelectGenderButton(
          icon: Icons.female,
          btnName: 'Female',
          onPress: () => bmiController.genderHandle("Female"),
        ),
      ],
    );
  }
}
