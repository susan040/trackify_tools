import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/expenses_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/widgets/added_category_bottom_sheet.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';
import 'package:trackify_tools/widgets/expenses_widget.dart';

class ExpensesAddedCategory extends StatelessWidget {
  ExpensesAddedCategory({super.key});
  final controller = Get.put(ExpensesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Added Category",
          style: CustomTextStyles.f16W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Column(
          children: [
            Container(
              height: 55,
              width: 258,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.secondaryTextColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTabButton('Expense', 0),
                  buildTabButton('Income', 1),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          AddedCategory(
                            icon: ImagePath.shopping,
                            name: "Shopping",
                            colors: Colors.amber,
                          ),
                          Divider(
                            color: AppColors.secondaryTextColor,
                            thickness: 1,
                          ),
                          AddedCategory(
                            icon: ImagePath.food,
                            name: "Groceries",
                            colors: Colors.red,
                          ),
                          Divider(
                            color: AppColors.secondaryTextColor,
                            thickness: 1,
                          ),
                          AddedCategory(
                            icon: ImagePath.education,
                            name: "Education",
                            colors: Colors.green,
                          ),
                          Divider(
                            color: AppColors.secondaryTextColor,
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  case 1:
                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        ExpensesSettings(
                          icon: ImagePath.salary,
                          name: "Salary",
                          colors: Colors.green,
                        ),
                        ExpensesSettings(
                          icon: ImagePath.partTime,
                          name: "Part-Time",
                          colors: Color.fromARGB(255, 42, 89, 127),
                        ),
                        ExpensesSettings(
                          icon: ImagePath.investment,
                          name: "Investment",
                          colors: Colors.purple,
                        ),
                        ExpensesSettings(
                          icon: ImagePath.others,
                          name: "Others",
                          colors: Color.fromARGB(255, 32, 48, 62),
                        ),
                        ExpensesSettings(
                          icon: ImagePath.add,
                          name: "Settings",
                          colors: const Color.fromARGB(255, 67, 82, 94),
                        ),
                      ],
                    );
                  default:
                    return Container();
                }
              }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: CustomElevatedButton(
                icon: ImagePath.add,
                height: 54,
                title: "Add Category",
                onTap: () {
                  addedCategoryBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 11.5, horizontal: 22.0),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? AppColors.primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              if (controller.selectedIndex.value == index && title == 'Expense')
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 18,
                ),
              if (controller.selectedIndex.value == index && title == 'Income')
                Image.asset(
                  ImagePath.income,
                  color: AppColors.whiteColor,
                  height: 18,
                  width: 18,
                ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: controller.selectedIndex.value == index
                      ? AppColors.whiteColor
                      : AppColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
