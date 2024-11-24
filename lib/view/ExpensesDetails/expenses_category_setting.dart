import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/expenses_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/view/ExpensesDetails/expenses_added_category.dart';
import 'package:trackify_tools/widgets/expenses_bottom_Sheet.dart';
import 'package:trackify_tools/widgets/expenses_widget.dart';

class ExpensesCategorySetting extends StatelessWidget {
  ExpensesCategorySetting({super.key});
  final controller = Get.put(ExpensesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Category Settings",
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
        height: MediaQuery.of(context).size.height * 1.3,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
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
                        runSpacing: 10,
                        children: [
                          ExpensesSettings(
                            icon: ImagePath.shopping,
                            name: "Shopping",
                            colors: Colors.amber,
                            isSelectable: true,
                            onTap: () {
                              expensesBottomSheet(context);
                            },
                          ),
                          ExpensesSettings(
                            icon: ImagePath.food,
                            name: "Food",
                            colors: Colors.red,
                          ),
                          ExpensesSettings(
                            icon: ImagePath.travel,
                            name: "Travel",
                            colors: AppColors.primaryColor,
                          ),
                          ExpensesSettings(
                            icon: ImagePath.car,
                            name: "Car",
                            colors: Color.fromARGB(255, 110, 210, 165),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.beauty,
                            name: "Beauty",
                            colors: Color.fromARGB(255, 250, 189, 210),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.social,
                            name: "Social",
                            colors: Color.fromARGB(255, 143, 130, 234),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.liquar,
                            name: "Liquor",
                            colors: Color.fromARGB(255, 243, 161, 210),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.education,
                            name: "Education",
                            colors: Color.fromARGB(255, 102, 227, 106),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.child,
                            name: "Child",
                            colors: const Color.fromARGB(255, 163, 205, 239),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.health,
                            name: "Health",
                            colors: Color.fromARGB(255, 244, 110, 100),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.repair,
                            name: "Repair",
                            colors: const Color.fromARGB(255, 234, 170, 147),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.donate,
                            name: "Donate",
                            colors: Color.fromARGB(255, 235, 72, 63),
                          ),
                          ExpensesSettings(
                            icon: ImagePath.add,
                            name: "Add More",
                            colors: Color.fromARGB(255, 42, 57, 61),
                            onTap: () {
                              Get.to(() => ExpensesAddedCategory());
                            },
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
            )
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
