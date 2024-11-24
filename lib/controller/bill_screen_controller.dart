import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class BillScreenController extends GetxController {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  TextEditingController serialNoController = TextEditingController();
  TextEditingController hsCodeController = TextEditingController();
  TextEditingController particularsController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  var tableData = <Map<String, dynamic>>[].obs;

  void addRow() {
    tableData.add({
      'serialNo': serialNoController.text,
      'hsCode': hsCodeController.text,
      'particulars': particularsController.text,
      'quantity': quantityController.text,
      'rate': rateController.text,
      'amount': (double.tryParse(quantityController.text) ?? 0) *
          (double.tryParse(rateController.text) ?? 0)
    });

    serialNoController.clear();
    hsCodeController.clear();
    particularsController.clear();
    quantityController.clear();
    rateController.clear();
  }

  late final DateTime now;
  late RxString formattedDate = ''.obs;
  var serialNumber = "".obs;
  var hsCode = "".obs;
  var particulars = "".obs;
  var quantity = 0.obs;
  var rate = 0.0.obs;

  var total = 0.0.obs;
  var discount = 0.0.obs;
  var grandTotal = 0.0.obs;
  var vat = 0.0.obs;

  void calculateTotals() {
    total.value = quantity.value * rate.value;
    vat.value = total.value * 0.13; 
    grandTotal.value = total.value + vat.value - discount.value;
  }

  BillScreenController() {
    now = DateTime.now();
    _updateFormattedDate();
  }

  void _updateFormattedDate() {
    if (Get.locale?.languageCode == 'ne') {
      NepaliDateTime nepaliNow = NepaliDateTime.fromDateTime(now);
      String nepaliDate = NepaliDateFormat('yyyy-MM-dd').format(nepaliNow);
      formattedDate.value =
          NepaliUnicode.convert(nepaliDate); 
    } else {
      formattedDate.value = DateFormat('yyyy-MM-dd').format(now);
    }
  }

  @override
  void onInit() {
    super.onInit();
    ever(Get.locale.obs, (locale) {
      _updateFormattedDate();
    });
  }

}
