import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback onTap;
  final double height;
  final bool isDisabled;
  final Color? backGroundColor;
  final Color? textColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.height = 50,
    this.isDisabled = false,
    this.backGroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor ?? AppColors.primaryColor,
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isDisabled ? null : onTap,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  icon!,
                  color: Colors.white,
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ),
            Text(
              title,
              style: CustomTextStyles.f14W400(color: textColor ?? Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
