import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/income_screen_controller.dart';
import 'package:trackify_tools/l10n/nepali_numbers.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/utils/image_path.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';
import 'package:trackify_tools/widgets/income_slab_table_widget.dart';

class IncomeTaxCalculatorScreen extends StatelessWidget {
  final IncomeTaxController controller = Get.put(IncomeTaxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          ('incomeTaxCalculator').tr,
          style: CustomTextStyles.f16W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 1.065,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        ('selectYear').tr, // JSON key for "Select Year"
                        style: CustomTextStyles.f14W600(
                            color: AppColors.borderColor),
                      ),
                      SizedBox(width: 110),
                      Text(
                        ('selectStatus').tr, // JSON key for "Select Status"
                        style: CustomTextStyles.f14W600(
                            color: AppColors.borderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Expanded(
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: AppColors.whiteColor),
                          child: Obx(() => DropdownButtonFormField<String>(
                                value:
                                    controller.selectedYearOption.value.isEmpty
                                        ? null
                                        : controller.selectedYearOption.value,
                                hint: Text(
                                  "selectYear".tr,
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.secondaryTextColor),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 18),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor, width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                  ),
                                ),
                                icon: SvgPicture.asset(
                                  ImagePath.textFieldIcon,
                                  color: AppColors.borderColor,
                                ),
                                items: controller.yearOptions
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option.tr,
                                            style: CustomTextStyles.f14W400(),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.updateSelected(value!);
                                },
                                validator: (value) => value == null
                                    ? 'PleaseSelectYear'.tr
                                    : null,
                              )),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: AppColors.whiteColor,
                          ),
                          child: Obx(() => DropdownButtonFormField<String>(
                                value:
                                    controller.selectStatusOption.value.isEmpty
                                        ? null
                                        : controller.selectStatusOption.value,
                                hint: Text(
                                  "selectStatus".tr,
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.secondaryTextColor),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 18),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor, width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                  ),
                                ),
                                icon: SvgPicture.asset(
                                  ImagePath.textFieldIcon,
                                  color: AppColors.borderColor,
                                ),
                                items: controller.statusOptions
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(option.tr,
                                              style:
                                                  CustomTextStyles.f14W400()),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value == 'Single' || value == 'Married') {
                                    controller.selectStatusOption.value =
                                        value!;
                                    // Update the salary slab table based on the selection
                                  }
                                },
                                validator: (value) => value == null
                                    ? 'PleaseSelectStatus'.tr
                                    : null,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        ('enterIncome').tr,
                        style: CustomTextStyles.f14W600(
                            color: AppColors.borderColor),
                      ),
                      SizedBox(width: 100),
                      Text(
                        ('selectTimePeriod').tr,
                        style: CustomTextStyles.f14W600(
                            color: AppColors.borderColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hint: "enterIncome".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          controller: controller.incomeController,
                          validator: (value) {
                            String actualValue = controller.isNepali.value
                                ? convertToEnglishNumber(value ?? '')
                                : value ?? '';

                            if (actualValue.isEmpty) {
                              return 'PleaseEnterIncome'.tr;
                            }
                            if (double.tryParse(actualValue) == null) {
                              return 'invalidIncome'.tr;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (controller.isNepali.value && value.isNotEmpty) {
                              String nepaliNumber =
                                  convertToNepaliNumber(value);
                              if (nepaliNumber !=
                                  controller.incomeController.text) {
                                controller.incomeController.value =
                                    TextEditingValue(
                                  text: nepaliNumber,
                                  selection: TextSelection.collapsed(
                                      offset: nepaliNumber.length),
                                );
                              }
                            } else if (!controller.isNepali.value &&
                                value.isNotEmpty) {
                              String englishNumber =
                                  convertToEnglishNumber(value);

                              if (englishNumber !=
                                  controller.incomeController.text) {
                                controller.incomeController.value =
                                    TextEditingValue(
                                  text: englishNumber,
                                  selection: TextSelection.collapsed(
                                      offset: englishNumber.length),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: AppColors.whiteColor),
                          child: Obx(() => DropdownButtonFormField<String>(
                                value: controller
                                        .selectYearMonthOption.value.isEmpty
                                    ? null
                                    : controller.selectYearMonthOption.value,
                                hint: Text(
                                  "selectTimePeriod".tr,
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.secondaryTextColor),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 18),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor, width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                  ),
                                ),
                                icon: SvgPicture.asset(
                                  ImagePath.textFieldIcon,
                                  color: AppColors.borderColor,
                                ),
                                items: controller.yearMonthOptions
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(option.tr,
                                              style:
                                                  CustomTextStyles.f14W400()),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.updateSelectedYearMonth(value!);
                                },
                                validator: (value) => value == null
                                    ? 'PleaseSelectYearOrMonths'.tr
                                    : null,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    ('annualAddition').tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  SizedBox(height: 7),
                  CustomTextField(
                      onChanged: (value) {
                        if (controller.isNepali.value && value.isNotEmpty) {
                          String nepaliNumber = convertToNepaliNumber(value);
                          if (nepaliNumber !=
                              controller.bonusController.value) {
                            controller.bonusController.text = nepaliNumber;
                            controller.bonusController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: controller
                                        .bonusController.text.length));
                          }
                        } else if (!controller.isNepali.value &&
                            value.isNotEmpty) {
                          String englishNumber = convertToEnglishNumber(value);
                          if (englishNumber !=
                              controller.bonusController.text) {
                            controller.bonusController.text = englishNumber;
                            controller.bonusController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset:
                                      controller.bonusController.text.length),
                            );
                          }
                        }
                      },
                      validator: (value) {
                        String actualValue = controller.isNepali.value
                            ? convertToEnglishNumber(value ?? '')
                            : value ?? '';

                        if (actualValue.isEmpty) {
                          return 'PleaseEnterAnnualAddition'.tr;
                        }
                        if (double.tryParse(actualValue) == null) {
                          return 'invalidInput';
                        }
                        return null;
                      },
                      controller: controller.bonusController,
                      hint: ('enterAdditionalBonus').tr,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
                  SizedBox(height: 20),
                  Text(
                    ('annualDeduction').tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  Text(
                    ('deductionsInfo').tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor),
                  ),
                  SizedBox(height: 7),
                  CustomTextField(
                      onChanged: (value) {
                        if (controller.isNepali.value && value.isNotEmpty) {
                          String nepaliNumber = convertToNepaliNumber(value);
                          if (nepaliNumber !=
                              controller.deductionController.value) {
                            controller.deductionController.text = nepaliNumber;
                            controller.deductionController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: controller
                                        .deductionController.text.length));
                          }
                        } else if (!controller.isNepali.value &&
                            value.isNotEmpty) {
                          String englishNumber = convertToEnglishNumber(value);
                          if (englishNumber !=
                              controller.deductionController.text) {
                            controller.deductionController.text = englishNumber;
                            controller.deductionController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: controller
                                      .deductionController.text.length),
                            );
                          }
                        }
                      },
                      validator: (value) {
                        String actualValue = controller.isNepali.value
                            ? convertToEnglishNumber(value ?? '')
                            : value ?? '';

                        if (actualValue.isEmpty) {
                          return 'PleaseEnterAnnualDeduction'.tr;
                        }
                        if (double.tryParse(actualValue) == null) {
                          return 'invalidInput';
                        }
                        return null;
                      },
                      controller: controller.deductionController,
                      hint: ('enterDeductions').tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                  SizedBox(height: 35),
                  SlabRateTable(
                    controller: controller,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Obx(() {
                        return controller.result.isNotEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  controller.result.value,
                                  style: CustomTextStyles.f14W600(
                                    color: AppColors.textColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container();
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              title: ('reset').tr,
                              textColor: AppColors.whiteColor,
                              onTap: controller.clearFields,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: CustomElevatedButton(
                              title: ('submit').tr,
                              textColor: AppColors.whiteColor,
                              onTap: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.calculateTax();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
