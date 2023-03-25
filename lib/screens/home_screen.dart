import 'package:crud/screens/add_task.dart';
import 'package:crud/screens/all_task.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/widsets/button_widset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double
            .maxFinite, // with this we make that de image take all  the sceen
        height: double
            .maxFinite, // with this we make that de image take all  the sceen
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hola',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: '\nEmpiesa tu hermoso dia',
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 14,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => AddTask(),
                  transition: Transition.zoom,
                  duration: Duration(seconds: 1),
                );
              },
              child: ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: 'Agregar Tarea',
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AllTasks(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                backgroundColor: Colors.white,
                text: 'Ver tareas',
                textColor: AppColors.mainColor,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/home.jpeg'),
          ),
        ),
      ),
    );
  }
}
