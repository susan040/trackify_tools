import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/bill_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';

class BillWidget extends StatelessWidget {
  final BillScreenController billController = Get.put(BillScreenController());
  BillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          color: AppColors.lightGrey,
          child: Table(
            border: TableBorder.all(width: 1, color: Colors.black),
            columnWidths: {
              0: FlexColumnWidth(0.8),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2.2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                children: [
                  buildTableHeader("S.N".tr, 1),
                  buildTableHeader("H.S Code".tr, 1),
                  buildTableHeader("Particulars".tr, 1),
                  buildTableHeader("Qty.".tr, 1),
                  buildTableHeader("Rate".tr, 1),
                  TableCell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTableHeader("Amount".tr, 1),
                        Table(
                          border: TableBorder(
                            left: BorderSide.none,
                            right: BorderSide.none,
                            top: BorderSide(width: 1, color: Colors.black),
                            bottom: BorderSide.none,
                            verticalInside:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          children: [
                            TableRow(
                              children: [
                                buildTableHeader("Rs.".tr, 1),
                                buildTableHeader("Rs.".tr, 1),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  TableCell(
                    child: Container(
                      height: 200,
                      child: Table(
                        border: TableBorder(
                          left: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide.none,
                          verticalInside:
                              BorderSide(width: 1, color: Colors.black),
                        ),
                        children: [
                          TableRow(
                            children: [
                              Container(
                                height: 200,
                                child: Text(""),
                              ),
                              Container(
                                height: 200,
                                child: Text(""),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.lightGrey,
          child: Table(
            border: TableBorder(
              top: BorderSide.none,
              bottom: BorderSide(width: 1, color: Colors.black),
              left: BorderSide(width: 1, color: Colors.black),
              right: BorderSide(width: 1, color: Colors.black),
              horizontalInside: BorderSide(width: 1, color: Colors.black),
              verticalInside: BorderSide(width: 1, color: Colors.black),
            ),
            columnWidths: {
              0: FlexColumnWidth(6),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(3),
            },
            children: [
              TableRow(children: [
                Text(""),
                TableCell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, bottom: 4, right: 4),
                        child: Text(
                          "Total".tr,
                          style: CustomTextStyles.f10W600(),
                        ),
                      ),
                      buildFooterTextRow("Discount".tr),
                      buildFooterTextRow("Grand Total".tr),
                      buildFooterTextRow("13% VAT".tr),
                      buildFooterTextRow("Grand Total".tr),
                    ],
                  ),
                ),
                TableCell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, bottom: 4, right: 4),
                        child: Text(
                          "",
                          style: CustomTextStyles.f10W600(),
                        ),
                      ),
                      buildFooterTextRow(""),
                      buildFooterTextRow(""),
                      buildFooterTextRow(""),
                      buildFooterTextRow(""),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          " ____________",
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30, top: 5),
          child: Text(
            "Signature".tr,
            style: CustomTextStyles.f12W400(),
          ),
        )
      ],
    );
  }
}

Widget buildTableHeader(String title, int flex) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 9, right: 3, top: 3, left: 3),
    child: Text(
      title,
      style: CustomTextStyles.f10W600(),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTextRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CustomTextStyles.f10W400(),
        ),
        Text(value),
      ],
    ),
  );
}

Widget buildFooterTextRow(String text) {
  return Table(
    border: TableBorder(
      left: BorderSide.none,
      right: BorderSide.none,
      top: BorderSide(width: 1, color: Colors.black),
      bottom: BorderSide.none,
      verticalInside: BorderSide(width: 1, color: Colors.black),
    ),
    children: [
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, bottom: 4, top: 4),
          child: Text(
            text,
            style: CustomTextStyles.f10W600(),
            textAlign: TextAlign.end,
          ),
        )
      ])
    ],
  );
}
