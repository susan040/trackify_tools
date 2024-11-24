import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/bill_screen_controller.dart';
import 'package:trackify_tools/models/product.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/view/home_screen.dart';
import 'package:trackify_tools/widgets/bill_screen_widget.dart';

class BillScreen extends StatelessWidget {
  final c = Get.put(BillScreenController());
  BillScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
          onTap: () => Get.to(() => HomeScreen()),
          child: Icon(
            Icons.close,
            color: AppColors.lGrey,
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Invoice".tr,
                    style:
                        CustomTextStyles.f24W600(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bill No:".tr,
                      style: CustomTextStyles.f12W600(
                          color: AppColors.borderColor),
                    ),
                    Obx(() => Text(
                          "Date: ${c.formattedDate.value}".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Vat No:".tr,
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Name of Buyers: ${product.customerName}".tr,
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Address: ${product.address}".tr,
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 15),
                BillWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
