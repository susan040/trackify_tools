import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';

class SavingGoalResult extends StatelessWidget {
  const SavingGoalResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Text("Result".tr,
            style: CustomTextStyles.f16W600(color: AppColors.whiteColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.3,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 50000,
                      minY: 0,
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey.withOpacity(0.2),
                            strokeWidth: 1,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '${value.toInt()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                            interval: 10000,
                          ),
                        ),
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          left: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 2270.41 + (24000 - 2270.41) + 10000,
                              color: Colors.blue,
                              width: 30,
                              borderRadius: BorderRadius.zero,
                            ),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _buildLegend(Colors.blue, "Initial deposit", "Rs 2,270.41"),
                SizedBox(
                  height: 20,
                ),
                _buildLegend(Colors.yellow, "Total Contributions", "Rs 24,000"),
                SizedBox(
                  height: 20,
                ),
                _buildLegend(Colors.red, "Interest earned", "Rs 10,000"),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your total savings:',
                      style:
                          CustomTextStyles.f12W600(color: AppColors.textColor),
                    ),
                    Text(
                      'Rs 36,270.41',
                      style:
                          CustomTextStyles.f12W600(color: AppColors.textColor),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Go back to calculations',
                      style: CustomTextStyles.f12W600(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            color: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: CustomTextStyles.f12W600(color: AppColors.textColor),
            ),
          ),
          Text(
            value,
            style: CustomTextStyles.f12W600(color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
