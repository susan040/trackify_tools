import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/saving_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/view/SavingGoalCalculator/saving_goal_result.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

class SavingGoalCalculator extends StatelessWidget {
  SavingGoalCalculator({super.key});
  final SavingScreenController controller = Get.put(SavingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Saving Goal Calculator".tr,
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
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.3,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Initial Amount".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                  hint: "initial_amount".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  onChanged: (value) => controller.interestRate.value = value,
                ),
                SizedBox(height: 20),
                Text("Monthly Contribution".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                  hint: "Monthly".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  onChanged: (value) => controller.period.value = value,
                ),
                SizedBox(height: 20),
                Text('Interest Rates (%)',
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              hint: "Rate %",
                              onChanged: (value) {
                                controller.updateInterestRate(value);
                              },
                              controller: TextEditingController(
                                text: controller.interestRate.value,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                color: AppColors.lGrey,
                                icon: Icon(Icons.arrow_drop_up),
                                onPressed: controller.incrementRate,
                              ),
                              IconButton(
                                color: AppColors.lGrey,
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: controller.decrementRate,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DropdownButton<String>(
                        value: controller.interestType.value,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.interestType.value = newValue;
                          }
                        },
                        items: controller.interestTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: CustomTextStyles.f14W400(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Period:',
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() => CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  hint: "Period",
                                  onChanged: (value) {
                                    controller.updatePeriod(value);
                                  },
                                  controller: TextEditingController(
                                    text: controller.period.value,
                                  ),
                                )),
                          ),
                          Column(
                            children: [
                              IconButton(
                                color: AppColors.lGrey,
                                icon: Icon(Icons.arrow_drop_up),
                                onPressed: controller.incrementPeriod,
                              ),
                              IconButton(
                                color: AppColors.lGrey,
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: controller.decrementPeriod,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Obx(() => DropdownButton<String>(
                            value: controller.periodType.value,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.periodType.value = newValue;
                              }
                            },
                            items: controller.periodTypes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: CustomTextStyles.f14W400(),
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CustomElevatedButton(
                  title: "submit".tr,
                  onTap: () {
                    Get.to(() => SavingGoalResult());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
