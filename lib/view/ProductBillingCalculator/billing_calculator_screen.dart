import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/bill_screen_controller.dart';
import 'package:trackify_tools/models/product.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/view/ProductBillingCalculator/bill_screen.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

class BillingCalculatorScreen extends StatelessWidget {
  final c = Get.put(BillScreenController());
  BillingCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "adding_products".tr,
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
                Text("customer_name".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.customerNameController,
                    hint: "enter_customer_name".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.name),
                SizedBox(height: 20),
                Text("product_name".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.productNameController,
                    hint: "enter_product_name".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.name),
                SizedBox(height: 20),
                Text("product_price".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.productPriceController,
                    hint: "enter_product_price".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                SizedBox(height: 20),
                Text("product_quantity".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.productQuantityController,
                    hint: "enter_product_quantity".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                SizedBox(height: 20),
                Text("discount".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.discountController,
                    hint: "enter_discount".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                SizedBox(height: 20),
                Text("address".tr,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.borderColor)),
                SizedBox(height: 7),
                CustomTextField(
                    controller: c.addressController,
                    hint: "enter_address".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text),
                SizedBox(height: 30),
                CustomElevatedButton(
                    title: "add_product".tr,
                    onTap: () {
                      // Create a Product instance with the entered data
                      Product product = Product(
                        // serialNumber:
                        //     0, // Set to a default value; adjust according to your logic
                        // amount:
                        //     (double.tryParse(c.productPriceController.text) ??
                        //                 0.0) *
                        //             (int.tryParse(
                        //                     c.productQuantityController.text) ??
                        //                 0) -
                        //         (double.tryParse(c.discountController.text) ??
                        //             0.0), // Calculate total amount
                        // hsCode: '', // Provide a value as needed
                        // particulars:
                        //     'Your product description here', // Set an appropriate description
                        // quantity:
                        //     int.tryParse(c.productQuantityController.text) ?? 0,
                        // rate: double.tryParse(c.productPriceController.text) ??
                        //     0.0, // Rate is the same as productPrice
                        customerName: c.customerNameController.text,
                        address: c.addressController.text,
                        productName: c.productNameController.text,
                        productPrice:
                            double.tryParse(c.productPriceController.text) ??
                                0.0,
                        productQuantity:
                            int.tryParse(c.productQuantityController.text) ?? 0,
                        discount:
                            double.tryParse(c.discountController.text) ?? 0.0,
                        particulars: c.particularsController.text,
                      );

                      Get.to(() => BillScreen(
                            product: product,
                          ));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
