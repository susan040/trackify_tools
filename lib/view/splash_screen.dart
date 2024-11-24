import 'package:flutter/material.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.logo,
                fit: BoxFit.cover,
                height: 195,
                width: 195,
              ),
              const SizedBox(height: 80),
              const CircularProgressIndicator(
                backgroundColor: AppColors.whiteColor,
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ));
  }
}
