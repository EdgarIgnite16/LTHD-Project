import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxString Gender = "Male".obs;
  RxInt Weight = 50.obs;
  RxDouble Height = 100.0.obs;
  RxInt Age = 18.obs;

  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  RxString BMIAdvice = "".obs;
  Rx<Color> colorStatus = const Color(0xff246AFE).obs;

  /// Hàm thay đổi giá trị Gender
  void genderHandle(String gender) {
    Gender.value = gender;
  }

  /// Hàm tính toán BMI
  void calcBMI() {
    var hMeter = Height / 100;
    tempBMI.value = Weight / (hMeter * hMeter);
    BMI.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(BMI.value);
    findStatus();
  }

  /// Hàm set trạng thái
  void findStatus() {
    if (tempBMI.value < 18.5) {
      BMIstatus.value = "UnderWeight";
      colorStatus.value = const Color(0xffFFB800);
      BMIAdvice.value = "Your BMI is ${tempBMI.value}. This indicates you are in the Underweight category for adults of your height."
          "\nIt's recommended to consult a healthcare professional to discuss healthy weight gain strategies for your specific situation.";
    }

    if (tempBMI.value > 18.5 && tempBMI.value < 24.9) {
      BMIstatus.value = "Normal";
      colorStatus.value = const Color(0xff00CA39);
      BMIAdvice.value = "Your BMI is ${tempBMI.value}. This indicates your weight is in the Normal category for adults of your height."
          "\nFor your height, a healthy weight range is from approximately ${53.5} to ${72} kilograms."
          "\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.";
    }

    if (tempBMI.value > 25.0 && tempBMI.value < 29.9) {
      BMIstatus.value = "OverWeight";
      colorStatus.value = const Color(0xffFF5858);
      BMIAdvice.value = "Your BMI is ${tempBMI.value}. This indicates you are in the Overweight category for adults of your height."
          "\nFor your height, a healthy weight range is from approximately ${53.5} to ${72} kilograms."
          "\nConsider consulting a healthcare professional or registered dietitian to discuss strategies for maintaining or reaching a healthy weight.";
    }

    if (tempBMI.value > 30.0 && tempBMI.value < 34.9) {
      BMIstatus.value = "OBESE";
      colorStatus.value = const Color(0xffFF0000);
      BMIAdvice.value = "Your BMI is ${tempBMI.value}. This indicates you are in the Obese Class II category for adults of your height."
          "\nA BMI in this range is associated with a significant increase in the risk of chronic diseases. "
          "\nWe strongly recommend consulting a healthcare professional to create a personalized weight management plan.";
    }

    if (tempBMI.value > 35.0) {
      BMIstatus.value = "Extremely OBESE";
      colorStatus.value = const Color(0xff000000);
      BMIAdvice.value = "Your BMI is ${tempBMI.value}. This indicates you are in the Extremely Obese category for adults of your height."
          "\nA BMI in this range is associated with serious health risks. "
          "\nWe urge you to consult a healthcare professional immediately to discuss a weight management plan and address any potential health concerns.";
    }
  }
}
