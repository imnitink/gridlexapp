import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';



class GetXUI {
  static errorSnackBar(String error) {
    Get.closeAllSnackbars();
    Get.rawSnackbar(
      message: error,
      title: AppStrings.error,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: AppColors.red,
      borderRadius: 15,
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static successSnackBar(String error) {
    Get.closeAllSnackbars();

    Get.rawSnackbar(
      message: error,
      title: AppStrings.success,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: AppColors.appGreenColor,
      borderRadius: 15,
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
