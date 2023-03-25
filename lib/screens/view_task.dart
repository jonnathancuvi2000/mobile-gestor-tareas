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

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({super.key, required this.id});

  _loadSingleData() async {
    // print(id);
    await Get.find<DataController>().getSingleData(id.toString());
    // print(Get.find<DataController>().singleData);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    _loadSingleData(); // WE GET DE DATA FROM THE BACK-END
    return Scaffold(
      body: GetBuilder<DataController>(builder: (controller) {
        nameController.text = controller.singleData["task_name"] ??
            "Nombre de la tarea no encontrado";
        detailController.text = controller.singleData["task_detail"] ??
            "Detalle de la tarea no encontrado";

        return Container(
          child: SingleChildScrollView(
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
                          title: 'Ver Tarea',
                          color: Colors.white,
                        ),
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
                          image: AssetImage('assets/4.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
                  child: Column(
                    children: [
                      TextFile(
                        readOnly: true,
                        hintText: 'Nombre Tarea',
                        textController:
                            nameController, //  para controlar el texto que ingresamos
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFile(
                        readOnly: true,
                        hintText: 'Detalle Tarea',
                        borderRadius: 15,
                        textController:
                            detailController, //  para controlar el texto que ingresamos
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
