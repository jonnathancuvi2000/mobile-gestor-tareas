import 'package:crud/screens/data_controller.dart';
import 'package:crud/screens/edit_task.dart';
import 'package:crud/screens/view_task.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/widsets/button_widset.dart';
import 'package:crud/widsets/header_widget.dart';
import 'package:crud/widsets/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});
  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    // print(Get.find<DataController>().myData.length);
    _loadData(); // we get the data again

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );

    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20, // this was not in the original code
              top: 40,
            ),
            alignment: Alignment
                .topLeft, // para alinear los elementos dentro del container
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: HeaderWidget(title: 'Editar Datos'),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(15, 10),
                bottomRight: Radius.elliptical(15, 10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/3.jpg'),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                  ),
                ),
                Expanded(child: Container()), // we used this to separete
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          // it was a problem with "ListView.builder" so we had to add 'Flexible' and that fixed the problem
          Flexible(
            child: GetBuilder<DataController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.myData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background:
                          leftEditIcon, // this runs when we dismiss form the left
                      secondaryBackground:
                          rightDeleteIcon, // this runs everytime we dismiss from the RIGHT
                      onDismissed: (DismissDirection diretion) {
                        // after dismiss this will run, taht is, after "confirmDismiss"
                        print("After dismiss...");
                      },
                      confirmDismiss: (DismissDirection diretion) async {
                        // this sruns first and we have to add "false" to dismiss
                        if (diretion == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              backgroundColor: Colors
                                  .transparent, // background of the modal (color of the modal)
                              // barrierColor: Colors.red,
                              context: context,
                              builder: (_) {
                                return Container(
                                  height: 250,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    // color: Color(0xFF2e3253).withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.off(()=>ViewTask(id: int.parse(controller.myData[index]["id"])));
                                        },
                                        child: ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: 'Ver',
                                            textColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                         onTap: () {
                                          Get.off(()=>EditTask(id: int.parse(controller.myData[index]["id"])));
                                        },
                                        child: ButtonWidget(
                                            backgroundColor: AppColors.mainColor,
                                            text: 'Editar',
                                            textColor: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // startToEnd goes from left to right
                          return false;
                        } else {
                          return Future.delayed(Duration(seconds: 1),
                              () => diretion == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: TaskWidget(
                          text: controller.myData[index]['task_name'],
                          color: Colors.blueGrey,
                        ),
                      ),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}
