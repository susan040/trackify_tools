import 'dart:ui';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var currentFlag = 'assets/images/usa.png'.obs;

  void switchLanguage(String languageCode) {
    if (languageCode == 'en') {
      Get.updateLocale(Locale('en'));
      currentFlag.value = 'assets/images/usa.png';
    } else if (languageCode == 'ne') {
      Get.updateLocale(Locale('ne'));
      currentFlag.value = 'assets/images/nepal.png';
    }
  }

  var currentIndex = 0.obs;
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'David R.',
      'image':
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
      'review':
          'Easy to use! This calculator quickly showed me my loan savings and helped me understand how different payment options would affect my finances. Its user-friendly and makes managing money easier.',
      'rating': "5",
    },
    {
      'name': 'Sarah L.',
      'image':
          'https://www.shutterstock.com/shutterstock/photos/2122700972/display_1500/stock-photo-image-of-young-asian-woman-company-worker-in-glasses-smiling-and-holding-digital-tablet-standing-2122700972.jpg',
      'review':
          'I love this tool! It made everything about managing my budget clear. I highly recommend it to anyone looking to easily track and optimize their financial planning.',
      'rating': "4",
    },
    {
      'name': 'Michael T.',
      'image':
          'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?cs=srgb&dl=pexels-justin-shaifer-501272-1222271.jpg&fm=jpg',
      'review':
          'Excellent tool! This calculator allowed me to easily see my loan savings and understand my financial options. Its intuitive and simple, making financial management much easier.',
      'rating': "5",
    },
  ];
}
