import 'package:crud/screens/add_task.dart';
import 'package:crud/screens/all_task.dart';
import 'package:crud/screens/data_controller.dart';
import 'package:crud/screens/home_practica.dart';
import 'package:crud/screens/home_screen.dart';
import 'package:crud/services/serviceHttp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // this alowss the routing

// page I got the images -> https://www.pexels.com/photo/food-wood-dawn-caffeine-14498872/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  loadData() async {
    // TareasApi instanse = TareasApi(); // this form the HTTP api
    await Get.find<DataController>().getData();
  //  await instanse.getTime();


  }

  @override
  Widget build(BuildContext context) {
    //  in tha way we are inizilicing and get the data for first time
    Get.lazyPut(() => DataController());
    loadData();

    return GetMaterialApp(
      // I added "Get" to use routing before it just was "MaterialApp"
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
