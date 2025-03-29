import 'package:ecommerceproject/controller/mainscreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

class CustomNavigationBar extends GetView<MainScreenControllerImp> {
  final void Function()? onpressed ;
  final IconData icondata ;
  final int index ;
  const CustomNavigationBar({super.key, this.onpressed, required this.icondata, required this.index});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onpressed,
        icon: Icon(
          icondata,
          size: 30,
          color: controller.currentIndex == index ? AppColors.primaryColor : AppColors.grey,)
    );
  }
}
