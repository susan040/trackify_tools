import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/emi_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/view/EMICalculator/emi_bill_screen.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

class EmiCalculatorScreen extends StatelessWidget {
  final EmiController emiController = Get.put(EmiController());
  EmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "emi_calculator".tr,
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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "loan_amount".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.loanAmountController,
                  hint: "loan_amount".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "tenure_years".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.tenureYearsController,
                  hint: "Year".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "Interest Rate (%)".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  controller: emiController.interestRateController,
                  hint: "rate(%)".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "emi_type".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: AppColors.whiteColor,
                  ),
                  child: Obx(() => DropdownButtonFormField<String>(
                        value: emiController.selectedEmiTypeOption.value.isEmpty
                            ? null
                            : emiController.selectedEmiTypeOption.value,
                        hint: Text(
                          "EmiType".tr,
                          style: CustomTextStyles.f12W400(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.borderColor, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 1),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          ImagePath.textFieldIcon,
                          color: AppColors.borderColor,
                        ),
                        items: emiController.typeOptions
                            .map((option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option.tr,
                                      style: CustomTextStyles.f14W400(
                                          color: AppColors.textColor)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          emiController.updateSelected(value!);
                        },
                        validator: (value) =>
                            value == null ? 'PleaseSelectEmiType'.tr : null,
                      )),
                ),
                SizedBox(height: 30),
                CustomElevatedButton(
                  title: "submit".tr,
                  onTap: () {
                    Get.to(() => EmiBillScreen(
                          loanAmount: emiController.loanAmountController.text,
                          tenureYears: emiController.tenureYearsController.text,
                          interestRate:
                              emiController.interestRateController.text,
                          emiType: emiController.selectedEmiTypeOption.value,
                        ));
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
