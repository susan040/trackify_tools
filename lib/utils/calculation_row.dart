import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';

class CalculationRow extends StatelessWidget {
  const CalculationRow({
    super.key,
    required this.textTheme,
    required this.theme,
    required this.title,
    required this.calculation,
  });

  final TextTheme textTheme;
  final ThemeData theme;

  final String title;
  final String calculation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.textColor,
            ),
          ),
          Text(calculation,
              style: textTheme.bodyMedium!.copyWith(
                color: AppColors.textColor,
              )),
        ],
      ),
    );
  }
}
