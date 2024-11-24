import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/interest_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

class InterestRateCalculator extends StatelessWidget {
  final InterestCalculatorController controller =
      Get.put(InterestCalculatorController());

  InterestRateCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Interest Rate Calculator'.tr,
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
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.1,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            // Add this wrapper
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Principal Amount'.tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  SizedBox(height: 7),
                  CustomTextField(
                    hint: 'Enter Principal'.tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    controller: controller.principalController,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Interest Rate (%)'.tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  SizedBox(height: 7),
                  CustomTextField(
                    hint: 'Enter Interest Rate'.tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    controller: controller.rateController,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Time Period'.tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  SizedBox(height: 7),
                  CustomTextField(
                    hint: 'Enter Time Period'.tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    controller: controller.timeController,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Obx(() {
                      return Text(
                        controller.result.value.isEmpty
                            ? ''
                            : 'Calculated Interest : Rs ${controller.result.value}'
                                .tr,
                        style: CustomTextStyles.f16W400(
                            color: AppColors.textColor),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          title: 'reset'.tr,
                          textColor: AppColors.whiteColor,
                          onTap: controller.onClose,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomElevatedButton(
                          title: 'submit'.tr,
                          textColor: AppColors.whiteColor,
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.calculateInterest();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
