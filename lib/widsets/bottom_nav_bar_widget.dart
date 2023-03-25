import 'package:crud/screens/add_task.dart';
import 'package:crud/screens/all_task.dart';
import 'package:crud/screens/home_screen.dart';
import 'package:crud/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int _currentIndex = 1;
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: GNav(
          backgroundColor: AppColors.mainColor,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: AppColors.secondaryColor,
          gap: 8,
          onTabChange: (index) {
            if (index == 0) {
              Get.to(() => HomeScreen());
            } else if (index == 1) {
              Get.to(() => AddTask());
            } else if (index == 2) {
              Get.to(() => AllTasks());
            }
            print(index);
          },
          padding: const EdgeInsets.all(8),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.task,
              text: "Agregar",
            ),
            GButton(
              icon: Icons.list_alt,
              text: "Listar",
            ),
          ],
        ),
      ),
    );
  }
}
