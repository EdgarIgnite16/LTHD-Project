import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/age_selector.dart';
import 'package:bmi_calculator/widgets/analyst_button.dart';
import 'package:bmi_calculator/widgets/height_selector.dart';
import 'package:bmi_calculator/widgets/select_gender.dart';
import 'package:bmi_calculator/widgets/theme_change_button.dart';
import 'package:bmi_calculator/widgets/weight_selector.dart';
import 'package:bmi_calculator/widgets/welcome_introduce_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// Nút chuyển đổi chủ đề giao diện
              const ThemeChangeButton(),
              const SizedBox(height: 10),

              /// Dòng giới thiệu
              const WelcomeAndIntroduceText(),
              const SizedBox(height: 40),

              const SelectGenderWidget(),
              const SizedBox(height: 20),

              /// Khu vực hiển thị
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Khu vực chọn chiều cao
                    HeightSelector(),
                    SizedBox(width: 10),

                    /// Khu vực chọn cân nặng và độ tuổi
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// 1. Khu vực chọn cân nặng
                          WeightSelector(),

                          /// 2. Khu vực chọn độ tuổi
                          AgeSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Button
              SizedBox(
                height: 50,
                child: AnalystButton(
                  icon: Icons.done,
                  btnName: "Let's Started",
                  onPress: () {
                    /// Thực hiện tính toán
                    bmiController.calcBMI();

                    /// Di chuyển tới trang kết quả
                    Get.to(const ResultScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
