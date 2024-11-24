import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/controller/expenses_screen_controller.dart';
import 'package:trackify_tools/utils/colors.dart';
import 'package:trackify_tools/utils/custom_text_style.dart';
import 'package:trackify_tools/widgets/custom/custom_textfield.dart';
import 'package:trackify_tools/widgets/custom/elevated_button.dart';

void addedCategoryBottomSheet(BuildContext context) {
  final c = Get.put(ExpensesScreenController());
  // final picker = Get.put(ImagePickerController());

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true, // Ensures the bottom sheet can take more space
    builder: (BuildContext context) {
      return FractionallySizedBox(
          heightFactor: 0.55,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 20.0,
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensure content takes only required space
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Add New Category",
                      style:
                          CustomTextStyles.f18W600(color: AppColors.textColor),
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      controller: c.nameController,
                      hint: "Enter Title",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Obx(() => Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: c.selectedBackgroundColor.value,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                c.selectedIcon.value,
                                size: 24,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(width: 7),
                        SizedBox(
                            height: 45,
                            width: 140,
                            child: CustomElevatedButton(
                                title: "Choose Icon",
                                onTap: () => showIconSelection(context))),
                        SizedBox(width: 7),
                        SizedBox(
                            height: 45,
                            width: 150,
                            child: CustomElevatedButton(
                                title: "Change Color",
                                onTap: () => showColorSelection(context))),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),

                SizedBox(height: 20),
                // Fixed bottom container for the button and camera
                Container(
                  padding: EdgeInsets.only(top: 135),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: CustomElevatedButton(
                            title: "Save",
                            onTap: () {
                              // Save logic
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    },
  );
}

void showIconSelection(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 250,
        child: GridView.count(
          crossAxisCount: 7,
          children: List.generate(iconList.length, (index) {
            return IconButton(
              icon: Icon(
                iconList[index],
                color: Colors.black,
              ),
              onPressed: () {
                Get.find<ExpensesScreenController>()
                    .changeIcon(iconList[index]);
                Navigator.pop(context);
              },
            );
          }),
        ),
      );
    },
  );
}

void showColorSelection(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 250, // Adjust the height as needed
        child: GridView.count(
          crossAxisCount: 5,
          children: List.generate(colorPalette.length, (index) {
            return GestureDetector(
              onTap: () {
                Get.find<ExpensesScreenController>()
                    .changeBackgroundColor(colorPalette[index]);
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 30),
                decoration: BoxDecoration(
                  color: colorPalette[index],
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      );
    },
  );
}

// List of available icons
List<IconData> iconList = [
  Icons.person,
  Icons.attach_file,
  Icons.music_note,
  Icons.build,
  Icons.cake,
  Icons.color_lens,
  Icons.computer,
  Icons.directions_bike,
  Icons.directions_bus,
  Icons.directions_car,
  Icons.directions_walk,
  Icons.subway,
  Icons.apartment,
  Icons.explore,
  Icons.face,
];

// Predefined color palette
List<Color> colorPalette = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.grey,
];
