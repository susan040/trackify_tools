import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/widgets/expenses_widget.dart';

class ExpensesScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final double radius = 45;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.primaryColor,
            value: 34.4,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.star, title: '34.4%', color: Colors.white),
            badgePositionPercentageOffset: 0.50, // Adjust the position
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.errorColor,
            value: 14.6,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.thumb_up, title: '14.6%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.shopping,
            value: 51,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.pie_chart, title: '51%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        default:
          throw Error();
      }
    });
  }

  var selectedIcon = Icons.person.obs;
  var selectedBackgroundColor = Color(0xFFFF0000).obs;
  var name = ''.obs;

  void changeIcon(IconData icon) {
    selectedIcon.value = icon;
  }

  void changeBackgroundColor(Color color) {
    selectedBackgroundColor.value = color;
  }

  void changeName(String newName) {
    name.value = newName;
  }

  Rxn<File> image = Rxn<File>();
  final picker = ImagePicker();
  void pickImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 200,
        maxWidth: 200);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }
}
