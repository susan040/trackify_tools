import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/income_screen_controller.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';

class SlabRateTable extends StatelessWidget {
  final IncomeTaxController controller;

  const SlabRateTable({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final slabData = controller.selectStatusOption.value == 'Single'
          ? controller.singleSlabs
          : controller.marriedSlabs;

      return Container(
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FixedColumnWidth(34.0),
            1: FixedColumnWidth(145.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(70.0),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('S.N'.tr, style: CustomTextStyles.f12W600()),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Salary_slab (${controller.selectStatusOption.value})'.tr,
                      style: CustomTextStyles.f12W600(),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('rate'.tr, style: CustomTextStyles.f12W600()),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('taxable_amt'.tr,
                        style: CustomTextStyles.f12W600()),
                  ),
                ),
              ],
            ),
            ...slabData.map((slab) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                      child: Text(
                        slab[0].tr,
                        style: CustomTextStyles.f12W400(),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                      child:
                          Text(slab[1].tr, style: CustomTextStyles.f12W400()),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                      child:
                          Text(slab[2].tr, style: CustomTextStyles.f12W400()),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                      child:
                          Text(slab[3].tr, style: CustomTextStyles.f12W400()),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}
