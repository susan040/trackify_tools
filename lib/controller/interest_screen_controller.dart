import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestCalculatorController extends GetxController {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var result = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void calculateInterest() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double time = double.tryParse(timeController.text) ?? 0.0;

    if (principal > 0 && rate > 0 && time > 0) {
      double interest = (principal * rate * time) / 100;
      result.value = interest.toStringAsFixed(2);
    } else {
      result.value = 'Please enter valid values.'.tr;
    }
  }

  void onClose() {
    principalController.clear();
    rateController.clear();
    timeController.clear();
    result.value = ''; 
  }
}
