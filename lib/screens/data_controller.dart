import 'dart:convert';

import 'package:crud/services/service.dart';
import 'package:crud/utils/app_constances.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Map<String, dynamic>_singleData={};
  Map<String, dynamic> get singleData => _singleData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstanse.GET_TASKS);
    // print(response.body);
    if (response.statusCode == 200) {
      _myData = response.body;
      print('We got the data ------ ');
      update();
    } else {
      print("We did nooooooot get the data");
    }
    _isLoading = false;
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstanse.GET_TASK}/$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        _singleData= response.body;
      }
      update();
    } else {
      print("We did not get the SINGLE data");
    }
    _isLoading = false;
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(
        AppConstanse.POST_TASK, {'task_name': task, 'task_detail': taskDetail});
    if (response.statusCode == 200) {
      update();
      print("Data post sucessfull");
    } else {
      print("Data POST Failed");
    }
  }

  Future<void> updateData(String task, String taskDetail, int singleData) async {
    _isLoading = true;
    Response response = await service.postData(
        AppConstanse.PUT_TASK, {'task_name': task, 'task_detail': taskDetail});
    if (response.statusCode == 200) {
      update();
      print("Data post sucessfull");
    } else {
      print("Data POST Failed");
    }
  }
}
