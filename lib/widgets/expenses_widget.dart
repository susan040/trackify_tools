import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.amount,
    required this.colors,
  });
  final IconData icon;
  final Color colors;
  final String name;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: CustomTextStyles.f14W600(
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  "- Rs. ${amount}",
                  style: CustomTextStyles.f14W600(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddedCategory extends StatelessWidget {
  const AddedCategory({
    super.key,
    required this.icon,
    required this.name,
    required this.colors,
    this.onTap,
  });

  final String icon;
  final Color colors;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                color: AppColors.whiteColor,
                size: 24,
              ),
            ),
            SizedBox(width: 15),
            Container(
              height: 41,
              width: 41,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                icon,
                color: Colors.white,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                name,
                style: CustomTextStyles.f14W600(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesSettings extends StatelessWidget {
  const ExpensesSettings({
    super.key,
    required this.icon,
    required this.name,
    required this.colors,
    this.onTap,
    this.isSelectable = false,
  });

  final String icon;
  final Color colors;
  final bool isSelectable;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          children: [
            Container(
              height: 44,
              width: 44,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                icon,
                color: Colors.white,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: CustomTextStyles.f12W600(),
            ),
          ],
        ),
      ),
    );
  }
}

class donutPieChart extends StatelessWidget {
  const donutPieChart({
    super.key,
    required this.iconData,
    required this.title,
    required this.color,
  });

  final IconData iconData;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
        const SizedBox(height: 2), // Spacing between icon and text
        Text(title, style: CustomTextStyles.f12W400()),
      ],
    );
  }
}
