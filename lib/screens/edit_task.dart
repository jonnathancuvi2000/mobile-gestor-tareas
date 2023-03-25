import 'package:crud/screens/all_task.dart';
import 'package:crud/screens/data_controller.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/widsets/button_widset.dart';
import 'package:crud/widsets/error_warning_msg.dart';
import 'package:crud/widsets/header_widget.dart';
import 'package:crud/widsets/textFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditTask extends StatelessWidget {
  final int id;
  const EditTask({super.key, required this.id});

  _loadSingleData() async {
    print(id);
    await Get.find<DataController>().getSingleData(id.toString());
    print(Get.find<DataController>().singleData);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    _loadSingleData(); // WE GET DE DATA FROM THE BACK-END

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning(
            "Nombre Tarea", "Porfavor ingrese el nombre de la tarea");
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning(
            "Detalle Tarea", "Porfavor ingrese el detalle de la tarea");
        return false;
      } else if (nameController.text.length <= 0) {
        Message.taskErrorOrWarning("Nombre Tarea",
            "El nombre de la tarea debe tener al menos 10 caracteres");
        return false;
      } else if (detailController.text.length <= 0) {
        Message.taskErrorOrWarning("Detalle Tarea",
            "El detalle de la tarea debe tener al menos 20 caracteres");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) { // with this we get teh data form the request
          nameController.text = controller.singleData["task_name"]??"Nombre de la tarea no encontrado";
          detailController.text = controller.singleData["task_detail"]??"Detalle de la tarea no encontrado";
       
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 40,
                        right: 20,
                      ),
                      alignment: Alignment
                          .topLeft, // para alinear los elementos dentro del container
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: HeaderWidget(
                          title: 'Editar Tarea',
                          color: Colors.white,
                        ),
                      ),
                      // child: InkWell(
                      //   onTap: () {
                      //     Get.back();
                      //   },
                      //   child: Icon(
                      //     Icons.arrow_back,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 3.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(15, 10),
                          bottomRight: Radius.elliptical(15, 10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/2.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: Column(
                    children: [
                      TextFile(
                        hintText: "Nombre Tarea",
                        textController:
                            nameController, //  para controlar el texto que ingresamos
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFile(
                        hintText: "Detalle Tarea",
                        borderRadius: 15,
                        textController:
                            detailController, //  para controlar el texto que ingresamos
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_dataValidation()) {
                            Get.find<DataController>().updateData(
                              nameController.text.trim(),
                              detailController.text.trim(),
                              controller.singleData["id"],
                            );
                            Get.to(
                              () => AllTasks(),
                              transition: Transition.circularReveal,
                            );
                          }
                        },
                        child: ButtonWidget(
                          backgroundColor: AppColors.mainColor,
                          text: 'Actualizar',
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
