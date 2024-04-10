import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              /// Back Button
              InkWell(
                onTap: () => Get.back(),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Tittle
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your BMI is",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: bmiController.colorStatus.value,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Circular
              SizedBox(
                child: Expanded(
                  child: Obx(
                    () => CircularPercentIndicator(
                      animationDuration: 1500,
                      footer: Text(
                        bmiController.BMIstatus.value,
                        style: TextStyle(
                          color: bmiController.colorStatus.value,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      radius: 130,
                      lineWidth: 30,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: bmiController.tempBMI.value / 100,
                      center: Text(
                        "${bmiController.BMI.value}%",
                        style: TextStyle(
                          color: bmiController.colorStatus.value,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: bmiController.colorStatus.value,
                      backgroundColor: bmiController.colorStatus.value.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Text Khuyến nghị
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  bmiController.BMIAdvice.value,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
