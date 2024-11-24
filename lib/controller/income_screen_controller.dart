import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/l10n/nepali_numbers.dart';

class IncomeTaxController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final incomeController = TextEditingController();
  final bonusController = TextEditingController();
  final deductionController = TextEditingController();
  RxString result = ''.obs;
  var isNepali = false.obs;

  void updateLocale(String value) {
    if (value == 'en') {
      Get.updateLocale(Locale('en'));
      isNepali.value = false;
    } else if (value == 'ne') {
      Get.updateLocale(Locale('ne'));
      isNepali.value = true;
    }
  }

  void calculateTax() {
    if (formKey.currentState?.validate() ?? false) {
      final double incomeValue =
          double.tryParse(convertToEnglishNumber(incomeController.text)) ?? 0;
      final double bonusValue =
          double.tryParse(convertToEnglishNumber(bonusController.text)) ?? 0;
      final double deductionsValue =
          double.tryParse(convertToEnglishNumber(deductionController.text)) ??
              0;

      // Determine if the income is monthly or yearly
      double totalIncome;
      if (selectYearMonthOption.value == 'Month') {
        totalIncome = (incomeValue + bonusValue - deductionsValue) *
            12; // Annualize the monthly income
      } else {
        totalIncome =
            incomeValue + bonusValue - deductionsValue; // Already yearly
      }

      double taxAmount = 0;

      // Get the appropriate slabs based on marital status
      List<List<String>> slabs = currentSlabs;

      // Iterate through slabs and calculate the tax amount
      for (var slab in slabs) {
        List<String> slabDetails = slab[1].split('_'); // Split salary range
        double slabStart = double.tryParse(slabDetails[0]) ?? 0;
        double slabEnd = slabDetails[1] == 'above'
            ? totalIncome
            : double.tryParse(slabDetails[1]) ?? 0;
        double slabRate = double.tryParse(
                slab[2].replaceAll('_percent', '').replaceAll(',', '')) ??
            0;

        if (totalIncome > slabStart) {
          double taxableAmount = totalIncome > slabEnd
              ? slabEnd - slabStart
              : totalIncome - slabStart;
          taxAmount += taxableAmount * (slabRate / 100);
        }
      }

      // Calculate the effective tax rate
      double effectiveTaxRate = (taxAmount / totalIncome) * 100;

      // If the input was monthly, calculate monthly tax by dividing the yearly tax by 12
      if (selectYearMonthOption.value == 'Month') {
        taxAmount /= 12; // Convert yearly tax to monthly
      }

      // Display the result in Nepali or English
      if (isNepali.value) {
        result.value =
            '${'Tax Amount'}: ${convertToNepaliNumber(taxAmount.toStringAsFixed(2))}\n${'Effective Tax Rate'}: ${convertToNepaliNumber(effectiveTaxRate.toStringAsFixed(2))}%';
      } else {
        result.value =
            '${'Tax Amount'}: Rs ${taxAmount.toStringAsFixed(2)}\n${'Effective Tax Rate'}: ${effectiveTaxRate.toStringAsFixed(2)}%';
      }
    } else {
      result.value = ''; // Clear the result if form validation fails
    }
  }

  final List<String> yearOptions = ['2024', '2025', '2026'];
  final List<String> statusOptions = ['Single', 'Married'];
  final List<String> yearMonthOptions = ['Year', 'Month'];

  var selectedYearOption = "".obs;
  var selectYearMonthOption = "".obs;
  var selectStatusOption = "".obs;

  final singleSlabs = [
    ['1.', '0_500000', '1_percent', '5,000'],
    ['2.', '500000_700000', '10_percent', '20,000'],
    ['3.', '700000_1000000', '20_percent', '60,0000'],
    ['4.', '1000000_2000000', '30_percent', '3,00,000'],
    ['5.', '2000000_5000000', '36_percent(plus 30% : 20% added)', '10,80,000'],
    ['6.', 'above_5000000', '39_percent(plus 30% : 30% added)', '3,90,0000'],
  ];

  final marriedSlabs = [
    ['1.', '0_600000', '1_percent', '6,000'],
    ['2.', '600000_800000', '10_percent', '20,000'],
    ['3.', '800000_1100000', '20_percent', '60,0000'],
    ['4.', '1100000_2000000', '30_percent', '2,70,000'],
    ['5.', '2000000_5000000', '36_percent(plus 30% : 20% added)', '10,80,000'],
    ['6.', 'above_5000000', '39_percent(plus 30% : 30% added)', '3,90,0000'],
  ];

  List<List<String>> get currentSlabs =>
      selectStatusOption.value == 'Single' ? singleSlabs : marriedSlabs;

  // Method to update selected status
  void updateSelectedStatus(String value) {
    selectStatusOption.value = value;
  }

  // Method to update selected year or months

  void updateSelectedYearMonth(String value) {
    selectYearMonthOption.value = value;
    log("Select Year or Months: ${selectYearMonthOption}".tr);
  }

  // Method to update the selected value
  void updateSelected(String value) {
    selectedYearOption.value = value;
  }

  void clearFields() {
    // If incomeController, bonusController, and deductionController are TextEditingControllers
    incomeController.clear();
    bonusController.clear();
    deductionController.clear();

    // If selectedYearOption, selectStatusOption, and selectYearMonthOption are RxStrings
    selectedYearOption.value = ''; // Clear the selected year option
    selectStatusOption.value = ''; // Clear the selected status option
    selectYearMonthOption.value = '';
    result.value = "";
  }
}
