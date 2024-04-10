import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/widgets/stepper_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          /// Chữ text
          Align(
            alignment: Alignment.center,
            child: Text(
              'Weight (KG)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// Chọn cân nặng
          Align(
            alignment: Alignment.center,
            child: Obx(
              () => Text(
                '${bmiController.Weight.value}',
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// Khu vực nút bấm chọn cân nặng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// Icon Minimize
              StepperButton(
                icon: Icons.minimize,
                onPress: () => bmiController.Weight.value--,
              ),

              /// Icon Add
              StepperButton(
                icon: Icons.add,
                onPress: () => bmiController.Weight.value++,
              ),
            ],
          )
        ],
      ),
    );
  }
}
