import 'package:crud/screens/add_task.dart';
import 'package:crud/screens/all_task.dart';
import 'package:crud/screens/home_screen.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/widsets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePractica extends StatefulWidget {
  HomePractica({super.key});

  @override
  State<HomePractica> createState() => _HomePracticaState();
}

class _HomePracticaState extends State<HomePractica> {
  final pages = [
    HomeScreen(),
    AddTask(),
    AllTasks(),
  ];

  int _currentIndex =0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Practica"),
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        color: AppColors.mainColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index)=>{setState(()=> _currentIndex=index,)},
            backgroundColor: AppColors.mainColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: AppColors.secondaryColor,
            gap: 8,
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
      ),
    );
  }
}
