import 'package:bmi_calculator/controllers/theme_controller.dart';
import 'package:bmi_calculator/widgets/select_gender.dart';
import 'package:bmi_calculator/widgets/theme_change_button.dart';
import 'package:bmi_calculator/widgets/welcome_introduce_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Thiết lập Theme Controller
    ThemeController themeController = Get.put(ThemeController());

    /// Giao diện
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
              const SizedBox(height: 10),

              /// Khu vực nút bấm chọn giới tính
              const SelectGenderWidget(),
              const SizedBox(height: 20),

              /// Khu vực hiển thị
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Column(
                          children: [
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            height: 200,
                            child: Text('data'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
